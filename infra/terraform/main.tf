data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


module "networking" {

  source = "./modules/networking"

  project_name = var.project_name

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets = var.public_subnets

  availability_zones = var.availability_zones

}

module "security" {
  source = "./modules/security"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.networking.vpc_id
  vpc_cidr         = var.vpc_cidr
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  environment       = var.environment
  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_pair_name     = var.key_pair_name
  security_group_id = module.security.security_group_id
  public_subnet_ids = module.networking.public_subnet_ids
  cluster_nodes     = var.cluster_nodes
}


locals {
  control_nodes = {
    for name, ip in module.compute.public_ips :
    name => ip
    if startswith(name, "control")
  }

  worker_nodes = {
    for name, ip in module.compute.public_ips :
    name => ip
    if startswith(name, "worker")
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../../ansible/inventory/hosts.ini"

  content = templatefile(
    "${path.module}/../../ansible/templates/inventory.tpl",
    {
      control = local.control_nodes
      workers = local.worker_nodes
    }
  )
}
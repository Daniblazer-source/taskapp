resource "aws_instance" "cluster_nodes" {

  for_each = var.cluster_nodes

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  subnet_id = var.public_subnet_ids[each.value.subnet]

  vpc_security_group_ids = [
    var.security_group_id
  ]

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-${var.environment}-${each.key}"
    Role = each.value.role
  }
}
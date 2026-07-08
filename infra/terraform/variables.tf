variable "aws_region" {
  type        = string
  description = "AWS region"
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "environment" {
  type        = string
  description = "Deployment environment"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones for the public subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "key_pair_name" {
  description = "AWS Key Pair name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH"
  type        = string
}

variable "cluster_nodes" {

  type = map(object({

    role = string

    subnet = number

  }))

}
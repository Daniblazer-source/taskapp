variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH. Leave empty to auto-detect."

  type    = string
  default = ""
}
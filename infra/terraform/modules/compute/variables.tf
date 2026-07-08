variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "cluster_nodes" {
  description = "Cluster node definitions"

  type = map(object({
    role   = string
    subnet = number
  }))
}
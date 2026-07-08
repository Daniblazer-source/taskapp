output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "security_group_id" {
  value = module.security.security_group_id
}

output "public_ips" {
  value = module.compute.public_ips
}

output "private_ips" {
  value = module.compute.private_ips
}

output "instance_ids" {
  value = module.compute.instance_ids
}
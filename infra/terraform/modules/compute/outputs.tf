output "public_ips" {
  value = {
    for name, instance in aws_instance.cluster_nodes :
    name => instance.public_ip
  }
}

output "private_ips" {
  value = {
    for name, instance in aws_instance.cluster_nodes :
    name => instance.private_ip
  }
}

output "instance_ids" {
  value = {
    for name, instance in aws_instance.cluster_nodes :
    name => instance.id
  }
}
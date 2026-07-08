output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "public_subnet_cidrs" {
  value = values(aws_subnet.public)[*].cidr_block
}

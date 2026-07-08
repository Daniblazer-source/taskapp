resource "aws_security_group" "k3s" {
  name        = "${var.project_name}-${var.environment}-k3s-sg"
  description = "Security group for the k3s cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.environment}-k3s-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = var.allowed_ssh_cidr

  from_port = 22
  to_port   = 22

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80
  to_port   = 80

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443
  to_port   = 443

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "kube_api" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = var.vpc_cidr

  from_port = 6443
  to_port   = 6443

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "cluster_internal" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = var.vpc_cidr

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.k3s.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"
}
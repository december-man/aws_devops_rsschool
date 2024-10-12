# Task 2: Networking Resources

# Deploy Security Group for NAT Instance / Bastion Host
resource "aws_security_group" "nat_sg" {
  description = "Security group for NAT Instance / Bastion Host"
  vpc_id      = aws_vpc.main_vpc.id
  name        = "nat_instance_sg"
  tags = {
    Name = "NAT/Bastion host Security Group"
  }
}

# Add Ingress Rules to allow ssh/icmp inbound traffic
resource "aws_security_group_rule" "ingress_ssh" {
  description       = "Allow inbound SSH traffic to NAT Instance / Bastion Host from specified IP Range"
  security_group_id = aws_security_group.nat_sg.id
  type              = "ingress"
  cidr_blocks       = var.ssh_inbound_ip
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}

resource "aws_security_group_rule" "ingress_icmp" {
  description       = "Allow inbound ICMP (Ping) traffic to NAT Instance / Bastion Host"
  security_group_id = aws_security_group.nat_sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
}

# Any Private inbound traffic within VPC is allowed by default.

# Add Egress Rulee to allow all outbound traffic
resource "aws_security_group_rule" "egress_any" {
  description       = "Allow any outbound traffic from NAT Instance / Bastion Host"
  security_group_id = aws_security_group.nat_sg.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
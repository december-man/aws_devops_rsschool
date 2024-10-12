# Task 2: Networking Resources

resource "aws_eip" "public_ip" {
  domain            = "vpc"
  network_interface = aws_network_interface.nat_interface.id
  tags = {
    Name = "Public IP for NAT Instance"
  }
}
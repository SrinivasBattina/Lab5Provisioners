
resource "aws_eip" "eip-nat" {
  tags = {
    Name = "NAT-EIP"
  }
}

resource "aws_nat_gateway" "Devopsnat" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.subnet-private.0.id

  tags = {
    Name = "Devopsnat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.newIGW]
}
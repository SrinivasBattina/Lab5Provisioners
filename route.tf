resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.awsvpc1.id
  route {
    gateway_id = aws_internet_gateway.newIGW.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "${var.vpc_name}public-table"
  }
}

resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.awsvpc1.id
  route {
    gateway_id = aws_nat_gateway.Devopsnat.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "${var.vpc_name}private-table"
  }
}
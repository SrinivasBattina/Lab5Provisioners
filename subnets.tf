resource "aws_subnet" "subnet-public" {
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.awsvpc1.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(lookup(var.azs, var.region), count.index)
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "subnet-private" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.awsvpc1.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(lookup(var.azs, var.region), count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}
resource "aws_security_group" "securitygroup" {
  name        = "allow_all"
  description = "allow all inbound traffic"
  vpc_id      = aws_vpc.awsvpc1.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
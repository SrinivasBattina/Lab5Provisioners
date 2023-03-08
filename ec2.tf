resource "aws_instance" "public-servers" {
  count         = length(var.public_cidr_block)
  ami           = lookup(var.amis, var.region)
  instance_type = var.instance_type
  #ami                         = var.imagename
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnet-public.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.securitygroup.id]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-public-server-${count.index + 1}"
    Env        = "prodcution"
    Owner      = "nene"
    CostCenter = "abcd"
  }
}

resource "aws_instance" "private-servers" {
  count         = 0 #length(var.private_cidr_block)
  ami           = lookup(var.amis, var.region)
  instance_type = var.instance_type
  #ami                         = var.imagename

  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.subnet-private.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.securitygroup.id]
  associate_public_ip_address = true
  tags = {
    Name       = "${var.vpc_name}-private-server-${count.index + 1}"
    Env        = "prodcution"
    Owner      = "nene"
    CostCenter = "abcd"
  }
  user_data  = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx jq
    echo "<h1>Deployed via Terraform on ${var.vpc_name}private-servers,${count.index + 1} </h1>" | | sudo tee /var/www/html/index.nginx-debian.html
    EOF
  depends_on = [aws_nat_gateway.Devopsnat]
}
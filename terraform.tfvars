region     = "us-east-2"
profile    = "default"
cidr_block = "10.1.0.0/16"
vpc_name   = "newVPC"
IGW_name   = "newIGW"
# azs               = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_cidr_block  = ["10.1.1.0/24", "10.1.2.0/24"]
private_cidr_block = ["10.1.10.0/24", "10.1.20.0/24"]
#imagename = "ami-0778521d914d23bc1"
key_name      = "onekey"
instance_type = "t2.nano"
amis = {
  "us-east-1" = "ami-0557a15b87f6559cf",
  "us-east-2" = "ami-09cd747c78a9add63",
}

azs = {
  "us-east-1" = ["us-east-1a", "us-east-1b", "us-east-1c"]
  "us-east-2" = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
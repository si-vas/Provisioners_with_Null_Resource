vpc_cidr      = "10.25.0.0/16"
vpc_name      = "Provisoner_vpc"
public_cidrs  = ["10.25.10.0/24", "10.25.20.0/24", "10.25.30.0/24"]
private_cidrs = ["10.25.1.0/24","10.25.2.0/24","10.25.3.0/24"]
azs           = ["ap-south-1a", "ap-south-1b"]
amis          = "ami-006d3995d3a6b963b"
instance_type = "t2.micro"
key_name      = "Ubuntu-Instance"

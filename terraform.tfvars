awsregion   = "ap-south-1"
vpc_cidr    = "192.168.0.0/16"
aws_vpc     = "null-resource"
public_cidr = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
# ingress_ports = ["22", "80", "443"]
# egress_ports  = ["22", "80", "443"]
amis = "ami-006d3995d3a6b963b"
azs  = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
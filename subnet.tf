resource "aws_subnet" "public-subnet" {
  count  = var.public_cidrs != var.azs ? 2 : 1
  vpc_id = aws_vpc.main.id
  #cidr_block = var.public_cidrs
  cidr_block = element(var.public_cidrs, count.index)
  #availability_zone = "ap-south-1a"
  availability_zone = element(var.azs, count.index)
  tags = {
    #Name = "${var.vpc_name}Terraform-Public-Subnet "
    Name = "${var.vpc_name}Terraform-Public-Subnet ${count.index + 1} "
  }
}

resource "aws_subnet" "private-subnet" {
  count  = var.public_cidrs != var.azs ? 2 : 1
  vpc_id = aws_vpc.main.id
  #cidr_block = var.private_cidrs
  cidr_block = element(var.private_cidrs, count.index)
  #availability_zone = "ap-south-1a"
  availability_zone = element(var.azs, count.index)
  tags = {
    #Name = "${var.vpc_name}Terraform-Private-Subnet "
    Name = "${var.vpc_name}Terraform-Private-Subnet ${count.index + 1} "
  }
}

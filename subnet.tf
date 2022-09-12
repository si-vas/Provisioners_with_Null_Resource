resource "aws_subnet" "public-subnet" {
  count  = var.public_cidrs != var.azs ? 3 : 1
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

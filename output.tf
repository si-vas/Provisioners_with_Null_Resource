output "vpc-id" {
  value = aws_vpc.main.id
}
output "public-subnet" {
  value = aws_subnet.public-subnet.*.id
}
output "ec2instanceip" {
  value = aws_instance.web.*.public_ip
}
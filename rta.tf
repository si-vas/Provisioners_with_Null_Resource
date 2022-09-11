resource "aws_route_table_association" "rta" {
  count = length(var.azs)
  #subnet_id = aws_subnet.public-subnet.id
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.rt.id
}
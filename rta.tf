resource "aws_route_table_association" "public-rta" {
  count = length(var.azs)
  #subnet_id = aws_subnet.public-subnet.id
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private-rta" {
  count = length(var.azs)
  #subnet_id = aws_subnet.private-subnet.id
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}
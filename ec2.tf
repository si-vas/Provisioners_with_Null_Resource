resource "aws_instance" "web" {
  count                       = 3
  ami                         = var.amis
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  #subnet_id                  = "${aws_subnet.public-subnet.id}"
  subnet_id              = element(aws_subnet.public-subnet.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  #depends_on                 = [aws_subnet.public-subnet]
  tags = {
    Name = "Server-${count.index + 1}"
  }
}
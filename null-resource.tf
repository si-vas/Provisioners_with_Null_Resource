resource "null_resource" "ec2-automation" {
  count = 3
  provisioner "file" {
    source      = "userdata.sh"
    destination = "/tmp/userdata.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Ubuntu-Instance.pem")
      #host = "${aws_instance.web.public_ip}"
      host = element(aws_instance.web.*.public_ip, count.index)
    }
  }
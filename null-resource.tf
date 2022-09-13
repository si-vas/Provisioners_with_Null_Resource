
resource "null_resource" "deletefiles" {
  provisioner "local-exec" {
    command = "del *ips"
  }
}

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
      host = element(aws_instance.Public-Server.*.public_ip, count.index)
    }
  }
  provisioner "file" {
    source      = "aws_cli.sh"
    destination = "/tmp/aws_cli.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Ubuntu-Instance.pem")
      #host = "${aws_instance.web.public_ip}"
      host = element(aws_instance.Public-Server.*.public_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/userdata.sh",
      "sudo chmod 777 /tmp/aws_cli.sh",
      "sudo chmod 777 /var/www/html/index.nginx-debian.html",
      "cd /tmp",
      "./userdata.sh",
      "./aws_cli.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("Ubuntu-Instance.pem")
      #host = "${aws_instance.web.public_ip}"
      host = element(aws_instance.Public-Server.*.public_ip, count.index)
    }
  }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.Public-Server.*.public_ip, count.index)} >> public_ips.txt && echo ${element(aws_instance.Public-Server.*.private_ip, count.index)} >> public_ips.txt"
  }
}
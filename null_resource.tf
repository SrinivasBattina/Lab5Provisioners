resource "null_resource" "execute_script" {
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("onekey.pem")
      host        = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script/sh"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("onekey.pem")
      host        = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }
}
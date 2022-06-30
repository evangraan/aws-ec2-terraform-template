terraform {
  required_version = ">= 1.0.7"
}

variable "key_path" {
  default = "path-to-key.pub"
}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("path-to-key.pub")
}

resource "aws_instance" "ubuntu" {
  ami                         = "ami-0bd2099338bc55e6d"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.mykey.id
  vpc_security_group_ids      = [aws_security_group.rtmp-servers.id]
  subnet_id                   = element(aws_subnet.public_subnet.*.id, 0)
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 30
    delete_on_termination = true
  }

  tags = {
    Name = "RTMP-00001"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("path-to-key")
    }
  }
}

output "instance-private-ip" {
  value = aws_instance.ubuntu.private_ip
}

output "instance-public-ip" {
  value = aws_instance.ubuntu.public_ip
}

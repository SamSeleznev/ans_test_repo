provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "webapp_instance" {
  ami           = "ami-04cebc8d6c4f297a3"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-02aecc7bf2b1840dc"]
  key_name      = "id_rsa"
  tags = {
    Name    = "webapp_instance"
    Owner   = "Semen Seleznev"
    Project = "TestEffMob"
  }
}

resource "local_file" "instance_ip" {
  filename = "${path.module}/instance_ip.txt"
  content  = aws_instance.ubuntuserver.public_ip
}

output "instance_ip_addr" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ubuntuserver.public_ip
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region  = var.awsprops["region"]
}
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_instance" "webserver" {
  ami = var.awsprops["ami"]
  instance_type = var.awsprops["itype"]
  key_name = var.awsprops["key-name"]
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  associate_public_ip_address = true
  root_block_device {
    volume_type = "gp3"
    volume_size = var.awsprops["vol_size"]
    delete_on_termination = true #false
}
}
#provider "aws" {
resource "aws_eip_association" "webserver" {
    instance_id   = aws_instance.webserver.id
    allocation_id = aws_eip.eip_manager.id
    vpc           = true
   }


user_data = <<EOF

#!/bin/bash

sudo apt-get update

sudo apt-get upgrade -y

EOF
tags = {
    Name = "Terraform-ec2"
  }
output "IPAddress" {
  value = "${aws_instance.webserver.public_ip}"
}

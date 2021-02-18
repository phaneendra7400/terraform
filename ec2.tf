provider "aws" {
    region      = "ap-south-1"
}

resource "aws_instance" "terraform" {
  ami           = "ami-08e0ca9924195beba"
  instance_type= "t2.micro"
tags ={
  name = "linux"
  }
    user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install http
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
}

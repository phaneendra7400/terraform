provider "aws" {
    region      = "ap-south-1"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0fcd8d621cf9ab602"
  instance_type= "t2.micro"
tags ={
  name = "windows"
  }
}

provider "aws" {
    region      = "ap-south-1"
  access_key = "AKIAZG3FMK6DVM5IVJMP"
  secret_key = "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"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0fcd8d621cf9ab602"
  instance_type= "t2.micro"
tags ={
  name = "windows"
  }
}

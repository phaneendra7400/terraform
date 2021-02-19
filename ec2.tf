provider "aws" {
    region      = "ap-south-1"
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-08e0ca9924195beba"
  count=1
  key_name = "ansible"
  instance_type = "t2.micro"
  security_groups= [ "security_tomcat_port"]
      user_data = <<-EOF
       #!/bin/bash
           yum -y java-1.8.0-openjdk-devel 
            yum -y install tomcat 
               systemctl enable tomcat 
               systemctl start tomcat  
                echo " //etc/systemd/system/{{to muser}}.service "
EOF
  tags= {
    Name = "tomcat_instance"
  }
}

resource "aws_security_group" "security_tom_port" {
  name        = "security_tom_port"
  description = "security group for tom"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from tomcat server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags= {
    Name = "security_tom_port"
  }
}


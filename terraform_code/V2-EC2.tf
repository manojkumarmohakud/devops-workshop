provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "demo-server" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    key_name =  "dpp"
    security_groups = ["demo-sg"]
  
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "ssh access"
 

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}
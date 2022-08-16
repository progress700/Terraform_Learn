provider "aws" {
  region  = "eu-west-1"
  profile = "Developer"
}

resource "aws_instance" "orisaya_1" {
  ami                    = "ami-089950bc622d39ed8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ori_sg.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF

  tags = {
    Name = "ori_1"
    Dept = "testing"
  }
}

/*
# Without variable
resource "aws_security_group" "ori_sg" {
  name = "ori_sg"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
} */

# using variable for the server port
resource "aws_security_group" "ori_sg" {
  name = "ori_sg"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
  }

}
      
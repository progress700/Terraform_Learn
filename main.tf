provider "aws" {
  region  = "eu-west-1"
  profile = "Developer"
}

# Creating EC2 Instance
resource "aws_instance" "web-server-1" {
  ami                    = "ami-09e2d756e7d78558d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "web-server_1"
  }
}

resource "aws_security_group" "web-server" {

  # name = var.security_group_name

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
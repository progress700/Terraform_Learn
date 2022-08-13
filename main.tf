provider "aws" {
    region = "eu-west-1"
    profile = "Developer"
  }

  resource "aws_instance" "orisaya_1" {
    ami = "ami-089950bc622d39ed8"
    instance_type = "t2.micro"

    tags = {
      Name = "ori_1"
      Dept = "testing"
    }
      }

      
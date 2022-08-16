output "public_ip" {
    value = aws_instance.orisaya_1.public_ip
    description = "The public IP address of the web server"
  
}
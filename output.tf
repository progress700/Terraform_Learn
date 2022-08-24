output "public_ip" {
  value       = aws_instance.web-server-1
  description = "The public IP address of the web server"

}
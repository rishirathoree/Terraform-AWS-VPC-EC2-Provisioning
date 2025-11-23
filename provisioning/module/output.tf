output "ec2-server_public_ip" {
  description = "Public IPv4 address of ec2 server"
  value       = aws_instance.ec2-server.public_ip
}
output "bb_dns" {
  description = "DNS name of the EC2 instance"
  value       = aws_instance.bipolarbitsapplication.public_dns
}

output "bb_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.bipolarbitsapplication.public_ip
}

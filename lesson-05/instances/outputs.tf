output "public_dns" {
    description = "The public dns of the ec2 instance Ive just created"
    value = aws_instance.bipolarbitsapplication.public_dns
  
}

output "public_ip" {
    description = "public ip of the ec2 instance"
    value = aws_instance.bipolarbitsapplication.public_ip
}
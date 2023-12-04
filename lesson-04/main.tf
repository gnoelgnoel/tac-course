terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.50"
    }
  }

  required_version = "1.5.0"
}

provider "aws" {
  region  = "us-east-2"
  profile = "support"

}


resource "aws_instance" "bipolar-bits-application" {
  ami                    = "ami-0c7c4e3c6b4941f0f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.application-security-group.id]
  tags = {
    Name = "BipolarBits_application"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "application-security-group" {
  name        = "application security group"
  description = "allows only local http traffic"


  ingress {
    description = "limit only to local traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_default_vpc.default.cidr_block]

  }
  egress {
    description = "limit to all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 23
  protocol          = "tcp"
  cidr_blocks       = [aws_default_vpc.default.cidr_block]
  security_group_id = aws_security_group.application-security-group.id
}
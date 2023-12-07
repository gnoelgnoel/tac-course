terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
  }

  required_version = ">= 1.2.8"
}

provider "aws" {
  region  = "us-east-2"
  profile = var.PROFILE
}

resource "aws_instance" "lesson_07" {
  ami           = var.ami
  instance_type = var.machine_size
  tags = {
    Name = var.instance_name
  }
}
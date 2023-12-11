terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66"
    }
  }

  required_version = ">= 1.4.6"
}

provider "aws" {
  region  = "us-east-2"
  profile = "support"
}

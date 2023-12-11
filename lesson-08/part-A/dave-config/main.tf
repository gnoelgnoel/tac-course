provider "aws" {
  region  = "us-east-2"
  profile = "support"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

module "webserber-dave" {
  source         = "../modules/webserver"
  vpc_id         = aws_vpc.main.id
  cidr_block     = "10.0.0.0/24"
  ami            = "ami-05a36e1502605b4aa"
  instance_type  = "t2.micro"
  webserver_name = "maks's"
}
 
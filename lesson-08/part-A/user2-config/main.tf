provider "aws" {
  region  = "us-east-2"
  profile = "support"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "user 2 vpc"
  }

}

module "webserver-user2" {
  source         = "../modules/webserver"
  cidr_block     = "10.0.0.0/24"
  vpc_id         = aws_vpc.main.id
  ami            = "ami-05a36e1502605b4aa"
  instance_type  = "t2.micro"
  webserver_name = "second user webserver"

}
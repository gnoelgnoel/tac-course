variable "vpc_id" {
  type        = string
  description = "VPC ID"

}
variable "ami" {
  type        = string
  description = "ami of instance"

}

variable "cidr_block" {
  type        = string
  description = "cidr block of the vpc"
}

variable "instance_type" {
  type        = string
  description = "size of machine"

}

variable "webserver_name" {
  type        = string
  description = "Name of the webserver"

}
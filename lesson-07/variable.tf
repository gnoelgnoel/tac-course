variable "instance_name" {
  description = "Name tag of the instance"
  type        = string
  default     = "bipolarbitsapplication"
}

variable "ami" {
  description = "centos7 ami used in the project"
  type        = string
  default     = "ami-05a36e1502605b4aa"

}

variable "machine_size" {
  description = "size of the machine"
  type        = string
  default     = "t2.micro"
}

variable "PROFILE" {
  type = string

}

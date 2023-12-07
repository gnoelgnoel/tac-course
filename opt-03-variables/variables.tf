variable "region" {
  description = "The AWS region you would like to use"
  type        = string
  default     = "us-east-2"
}

variable "ami" {
  description = "The Amazon machine image to be used"
  type        = string
  default     = "ami-05a36e1502605b4aa"
  # I recommend the Debian image we used previously
  # ami-0c7c4e3c6b4941f0f
}

variable "name" {
  description = "Name tag of the instance"
  type        = string
  default     = "Bipolar Bits or whatever"
  # This will be the name that shows up on the AWS console and within tags
}

variable "category" {
  description = "The category for this instance"
  type        = string
  default     = "Training"
  # You can choose any category name you want: prod, dev, testing, etc...
}

variable "instance_type" {
  description = "The instance type for this machine"
  type        = string
  default     = "t2.micro"
}

variable "profile" {
  description = "The aws profile"
  type        = string
  default     = "support"
}
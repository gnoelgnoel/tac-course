variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "all_subnets" {
  description = "public_subnets"
  type        = list(string)

}

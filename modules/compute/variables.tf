variable "environment" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group" {
    type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "public_subnets" {
  type = list(string)
  description = "list of pulic subnet IDs where ASG can launch templates"
  
}
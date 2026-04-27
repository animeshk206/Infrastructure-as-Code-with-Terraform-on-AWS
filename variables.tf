variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "The environment name (dev, staging, or prod)"
  type        = string
  default     = "dev" 
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "engine_version" {
    type = string
}

variable "engine_name" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}

variable "database_name" {
    type = string
  
}

variable "username" {
    type = string
  
}
variable "db_subnet_group_name" {
  type = string
}

variable "db_security_group_id" {
  type = string
}

variable "environment" {
  type = string
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
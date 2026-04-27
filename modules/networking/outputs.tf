output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC created in this module"
}

output "public_subnet_1" {
    value = aws_subnet.public1.id
}

output "public_subnet_2" {
  value = aws_subnet.public2.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db_group.name
}



resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = var.engine_name
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  
  db_name              = var.database_name
  username             = var.username
  password             = var.db_password 
  
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.db_security_group_id]
  
  multi_az             = false 
  
  skip_final_snapshot  = true # So we can delete it easily in dev
  
  tags = {
    Name = "${var.environment}-db"
  }
}
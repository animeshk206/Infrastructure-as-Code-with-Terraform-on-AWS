resource "aws_launch_template" "web_lt" {
  name_prefix= "${var.environment}-web-lt-"
  image_id      = "ami-05d2d839d4f73aafb"
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.environment}-web-server"
    }
  }
}

resource "aws_autoscaling_group" "web_asg" {
  name                = "${var.environment}-web-asg"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  
  vpc_zone_identifier = var.public_subnets

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
}
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support   = true   
    enable_dns_hostnames = true
    tags = {
    Name = "${var.environment}-vpc"
    }  
}

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "${var.aws_region}a"
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "${var.aws_region}b"
    map_public_ip_on_launch = true
    tags = {
    Name = "public-subnet-2"
    }
}

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "${var.aws_region}a"
    tags = {
    Name = "private-subnet-1"
    }
}

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "${var.aws_region}b"
    tags = {
    Name = "private-subnet-2"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "${var.environment}-igw"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
    Name = "${var.environment}-public-rt"
    }
}

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.public.id
}

    resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_db_subnet_group" "db_group" {
    name = "${var.environment}-db-subnet-group"
    subnet_ids = [ aws_subnet.private1.id, aws_subnet.private2.id]

    tags = {
      Name = "${var.environment}-db-subnet-group"
    } 
}
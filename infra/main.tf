provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-0c0f8e8862add7cc4", "	subnet-06c116155ebf88256"]
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.db_instance_identifier
  allocated_storage      = var.db_allocated_storage
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = "vpc-0406168dfab5463cd"

  tags = {
    Name = var.db_instance_identifier
  }
}

output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

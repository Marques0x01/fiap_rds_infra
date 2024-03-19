provider "aws" {
  region = "sa-east-1"
}

resource "aws_db_instance" "fiap-lanches-postgres-db-instance" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16"
  identifier             = "fiap-lanches-postgres-db-instance"
  instance_class         = "db.t3.micro"
  password               = "mysecretpassword"
  skip_final_snapshot    = true
  storage_encrypted      = false
  publicly_accessible    = true
  username               = "postgres"
  apply_immediately      = true
  db_subnet_group_name   = "fiaplanches"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"

  name = "fiap-lanches-vpc"
  create_vpc = false
}

resource "aws_security_group" "allow_tls" {
  depends_on = [ module.vpc ]
  name   = "allow_tls"
  vpc_id = module.vpc.default_vpc_id
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group_rule" "allow_all" {
  type                = "ingress"
  to_port             = 5432
  protocol            = "tcp"
  from_port           = 5432
  security_group_id   = aws_security_group.allow_tls.id
  cidr_blocks         = ["0.0.0.0/0"]
}
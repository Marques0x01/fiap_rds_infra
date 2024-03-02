provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-06c116155ebf88256", "subnet-07ecd7f2bded15e89", "subnet-0be83c0e61177a7f5"]
}

resource "aws_rds_cluster" "postgres_cluster" {
  cluster_identifier        = "postgres-cluster"
  engine                    = "postgres"
  engine_version            = "16"
  master_username           = "jamal"
  master_password           = "jamal@aws666"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = true
  allocated_storage         = 2
  storage_type              = "gp2"
  db_cluster_instance_class = "db.t3.small"
  availability_zones = [ "us-east-1a" ]
}

resource "aws_rds_cluster_instance" "postgres_instance" {
  count                     = 1
  cluster_identifier        = aws_rds_cluster.postgres_cluster.id
  instance_class            = "db.t3.small"
  engine                    = "postgres"
  engine_version            = "16.2"
}

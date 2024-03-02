provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-0c0f8e8862add7cc4", "subnet-06c116155ebf88256"]
}

resource "aws_rds_cluster" "postgres_cluster" {
  cluster_identifier        = "postgres-cluster"
  engine                    = "aurora-postgresql"
  engine_version            = "11"
  master_username           = "admin"
  master_password           = "your_password"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = true
}

resource "aws_rds_cluster_instance" "postgres_instance" {
  count                     = 1
  cluster_identifier        = aws_rds_cluster.postgres_cluster.id
  instance_class            = "db.t2.micro"
  engine                    = "aurora-postgresql"
  engine_version            = "11"
}

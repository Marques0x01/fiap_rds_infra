provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-0c0f8e8862add7cc4", "subnet-06c116155ebf88256"]
}

resource "aws_rds_cluster" "postgres_cluster" {
  cluster_identifier        = "postgres-cluster"
  engine                    = "postgres"
  engine_version            = "12.7"
  master_username           = "jamal"
  master_password           = "jamal69guloso"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = true
}

resource "aws_rds_cluster_instance" "postgres_instance" {
  count                     = 1
  cluster_identifier        = aws_rds_cluster.postgres_cluster.id
  instance_class            = "db.t3.micro"
  engine                    = "postgres"
  engine_version            = "12.7"
}

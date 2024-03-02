provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-06c116155ebf88256", "subnet-07ecd7f2bded15e89"]
}

resource "aws_rds_cluster" "postgres_cluster" {
  cluster_identifier        = "postgres-cluster"
  engine                    = "postgres"
  engine_version            = "12"
  master_username           = "jamal"
  master_password           = "jamal69guloso"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = true
  allocated_storage         = 5
  db_cluster_instance_class = "db.t3.micro"
}

resource "aws_rds_cluster_instance" "postgres_instance" {
  count                     = 1
  cluster_identifier        = aws_rds_cluster.postgres_cluster.id
  instance_class            = "db.t3.micro"
  engine                    = "aurora-postgresql"
  engine_version            = "12"
}

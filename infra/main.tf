provider "aws" {
  region = "us-west-1"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-0c0f8e8862add7cc4", "subnet-06c116155ebf88256"]
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier        = "aurora-cluster"
  engine                    = "aurora"
  engine_version            = "5.7.mysql_aurora.2.08.0"
  master_username           = "admin"
  master_password           = "your_password"
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot       = true
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count                     = 1
  cluster_identifier        = aws_rds_cluster.aurora_cluster.id
  instance_class            = "db.t2.micro"
  engine                    = "aurora"
  engine_version            = "5.7.mysql_aurora.2.08.0"
}

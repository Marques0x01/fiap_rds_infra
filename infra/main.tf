  provider "aws" {
    region = "sa-eat-1"
  }
  resource "aws_db_instance" "fiap-lanches-postgres-db-instance" {
    allocated_storage    = 2
    engine               = "postgres"
    engine_version       = "16"
    identifier           = "fiap-lanches-postgres-db-instance"
    instance_class       = "db.t3.micro"
    password             = "mysecretpassword"
    skip_final_snapshot  = true
    storage_encrypted    = false
    publicly_accessible    = true
    username             = "postgres"
    apply_immediately = true
  }
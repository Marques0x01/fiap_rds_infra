provider "aws" {
    region = "us-east-1"
  }
  resource "aws_db_instance" "fiap-lanches-postgres-db-instance" {
    allocated_storage     = 20
    engine                = "postgres"
    engine_version        = "16"
    identifier            = "fiap-lanches-postgres-db-instance"
    instance_class        = "db.t3.micro"
    password              = "mysecretpassword"
    skip_final_snapshot   = true
    storage_encrypted     = false
    publicly_accessible   = true
    username              = "postgres"
    apply_immediately     = true
    port = 5432
    vpc_security_group_ids = ["sg-0f822ea11cc88f58d"]
    db_subnet_group_name = ["subnet-0382c49986737e64f", "subnet-061b54583b8a8320b", "subnet-07d63e9dbb0a78416"]
  }

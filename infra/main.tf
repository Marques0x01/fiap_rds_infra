  provider "aws" {
    region = "ap-southeast-2"
  }
  resource "aws_db_instance" "dsdj-postgres-db-instance" {
    allocated_storage    = 20
    #db_subnet_group_name = "db-subnetgrp"
    engine               = "postgres"
    engine_version       = "16"
    identifier           = "dsdj-postgres-db"
    instance_class       = "db.t2.micro"
    password             = "mypostgrespassword"
    skip_final_snapshot  = true
    storage_encrypted    = false
    publicly_accessible    = true
    username             = "postgres"
    apply_immediately = true
  }
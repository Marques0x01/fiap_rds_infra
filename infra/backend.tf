terraform {
  backend "s3" {
    bucket = "tfstate-fiap"
    key    = "rds-postgres/terraform.tfstate"
    region = "us-east-1"
  }
}

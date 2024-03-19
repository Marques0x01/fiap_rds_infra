provider "aws" {
  region = "us-east-1"
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
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  depends_on = [aws_security_group.allow_tls, aws_db_subnet_group.subnet_group]
}

resource "aws_security_group" "allow_tls" {
  name   = "allow_tls"
  vpc_id = "vpc-068207d590edc3748"
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group_rule" "allow_all" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  security_group_id = aws_security_group.allow_tls.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_subnet_group" "subnet_group" {
  name = "db-fiaplanches-sb-group"
  subnet_ids = ["subnet-0a44428f9535c2d80",
    "subnet-0cff870d98841b1f7",
    "subnet-0219a18d841685bf2",
    "subnet-08c690607669bc819",
    "subnet-03a3d01b444be36f9",
  "subnet-09668b48379dbd6c5"]
}

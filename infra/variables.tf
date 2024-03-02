variable "region" {
  description = "A região da AWS onde o cluster RDS será criado"
}

variable "db_instance_identifier" {
  description = "O identificador único para o cluster RDS"
}

variable "db_name" {
  description = "O nome do banco de dados a ser criado"
}

variable "db_username" {
  description = "O nome de usuário do banco de dados"
}

variable "db_password" {
  description = "A senha do banco de dados"
}

variable "db_instance_class" {
  description = "A classe da instância do banco de dados"
}

variable "db_allocated_storage" {
  description = "O tamanho do armazenamento alocado para o banco de dados (em GB)"
}

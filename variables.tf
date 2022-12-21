variable "region" {
  default = "eu-central-1"

}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "db_user" {
  default = "admin"

}

variable "container_name" {
  default = "wordpress"
}





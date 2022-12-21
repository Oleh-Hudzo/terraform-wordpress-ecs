provider "aws" {
  region = var.region
}

resource "aws_db_instance" "terraform_rds" {
  identifier              = "terraform-rds-wordpress"
  allocated_storage       = 10
  db_name                 = "wordpress_rds"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  username                = var.db_user
  password                = random_password.password.result
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = false
  backup_retention_period = 0
  vpc_security_group_ids  = [aws_security_group.wordpress_rds_sg.id]
  availability_zone       = "eu-central-1a"
  tags = {
    "Name" = "Wordpress-rds"
  }
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "terraform-wordpress-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

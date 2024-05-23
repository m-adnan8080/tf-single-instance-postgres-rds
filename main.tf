resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5.0"

  identifier = "my-postgresql-db"

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  username = var.username
  password = random_password.db_password.result

  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = var.publicly_accessible

  # Backup and maintenance configurations
  backup_retention_period = var.backup_retention_period
  maintenance_window      = var.maintenance_window

  # Database configurations
  db_name = var.db_name

  # Optional settings
  multi_az              = var.multi_az
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  # Monitoring and logging
  monitoring_interval = var.monitoring_interval
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
}

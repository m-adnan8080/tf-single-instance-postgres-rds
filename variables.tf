variable "vpc_id" {
  type = string
}

variable "rds_sg_name" {
  type = string
}

variable "engine" {
  type = string
  description = "RDS Engine"
  default = "postgres"
}

variable "engine_version" {
  type = string
  description = "PostgreSQL Version"
  default = "14.4"
}

variable "instance_class" {
  type = string
  description = "RDS Instance type"
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type = number
  description = "Storage size in GB"
  default = 20
}

variable "storage_type" {
  type = string
  description = "Storage type"
  default = "gp2"
}

variable "db_name" {
  type = string
  default = "pgdb"
}

variable "username" {
  type = string
  description = "PostgreSQL username"
}

variable "db_subnet_group_name" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "publicly_accessible" {
  type = bool
  default = false
}

variable "backup_retention_period" {
  type = number
  default = 7
}

variable "maintenance_window" {
  type = string
  default = "Mon:00:00-Mon:03:00"
}

variable "multi_az" {
  type = bool
  default = false
}

variable "auto_minor_version_upgrade" {
  type = bool
  default = true
}

variable "copy_tags_to_snapshot" {
  type = bool
  default = true
}

variable "monitoring_interval" {
  type = number
  default = 60
}

variable "enabled_cloudwatch_logs_exports" {
  type = list(string)
  default = [ "postgresql" ]
}
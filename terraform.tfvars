engine = "postgres"
engine_version = "14.4"
instance_class = "db.t3.micro"
allocated_storage = 20
storage_type = "gp2"
db_name = "pgdb"

username = "dbadmin"

db_subnet_group_name = "database-sg"

publicly_accessible = false

backup_retention_period = 7
maintenance_window = "Mon:00:00-Mon:03:00"
multi_az = false
auto_minor_version_upgrade = true
copy_tags_to_snapshot = true
monitoring_interval = 60
enabled_cloudwatch_logs_exports = [ "postgresql" ]
output "db_password" {
  value       = random_password.db_password.result
  description = "The password for the RDS PostgreSQL instance"
  sensitive   = true
}

output "db_endpoint" {
  value       = module.db.this_db_instance_address
  description = "The endpoint of the RDS PostgreSQL instance"
}

output "db_port" {
  value       = module.db.this_db_instance_port
  description = "The port of the RDS PostgreSQL instance"
}

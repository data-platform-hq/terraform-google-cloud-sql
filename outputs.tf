output "sql_instance_ip" {
  value       = google_sql_database_instance.sql_instance.private_ip_address
  description = "The first private IPv4 address assigned to sql instance."
}

output "sql_instance_name" {
  value       = google_sql_database_instance.sql_instance.name
  description = "The sql instance name."
}

output "sql_service_acc" {
  value       = google_sql_database_instance.sql_instance.service_account_email_address
  description = "The service account email address assigned to the sql instance."
}

output "users_creds" {
  value       = { for k, v in var.users : replace(k, "user_name", "user_pass") => random_string.sqluser_passwd[k].result }
  description = "Passwords for provided users."
}

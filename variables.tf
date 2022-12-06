variable "region" {
  description = "The location or cloud resources region for the environment."
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)."
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "network" {
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP."
  type        = string
}

variable "purpose" {
  description = "The purpose of the resource. VPC_PEERING or PRIVATE_SERVICE_CONNECT."
  type        = string
  default     = "VPC_PEERING"
}

variable "address_type" {
  description = "The type of the address to reserve. EXTERNAL or INTERNAL."
  type        = string
  default     = "INTERNAL"
}

variable "prefix_length" {
  description = "The prefix length of the IP range. For more see google_compute_global_address resource description."
  type        = number
  default     = "24"
}

variable "service" {
  description = "Provider peering service that is managing peering connectivity for a service provider organization."
  type        = string
  default     = "servicenetworking.googleapis.com"
}

variable "db_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use (see the description of the google_sql_database_instance resource)."
  type        = string
  default     = "SQLSERVER_2019_EXPRESS"
}

variable "root_passwd" {
  description = "Initial root password. Required for MS SQL Server."
  type        = string
}

variable "tier" {
  description = "The machine type to use."
  type        = string
}

variable "public_ip" {
  description = "Whether this Cloud SQL instance should be assigned a public IPV4 address. At least public_ip must be enabled or a private_network must be configured."
  type        = bool
  default     = false
}

variable "require_ssl" {
  description = "Whether SSL connections over IP are enforced or not."
  type        = bool
  default     = true
}

variable "database_flags" {
  description = "Cloud SQL settinngs flags."
  type        = map(any)
  default     = {}
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the instance. To protect SQL instence set true."
  type        = bool
  default     = false
}

variable "user" {
  description = "The name of the SQL instance user."
  type        = string
  default     = ""
}

variable "passwd" {
  description = "The password of the SQL instance user."
  type        = string
  default     = ""
}

variable "labels" {
  description = "A set of key/value user label pairs to assign to the instance."
  type        = map(string)
  default     = {}
}

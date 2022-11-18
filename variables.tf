variable "region" {
  description = "The location or cloud resources region for the environment"
  type        = string
  default     = "us-west1"
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "network" {
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP"
  type        = string
}

variable "subnet" {
  description = "The subnet from which the Cloud SQL instance is accessible for private IP"
  type        = string
}

variable "root_passwd" {
  description = "The password for the root"
  type        = string
}

variable "database_flags" {
  description = "Cloud SQL instance settinngs flags"
  type        = map(any)
  default = {
    "user connections"      = "15"
    "default trace enabled" = "on"
    "remote access"         = "off"
  }
}


variable "user" {
  description = "The name of the SQL instance user"
  type        = string
  default     = ""
}

variable "passwd" {
  description = "The password of the SQL instance user"
  type        = string
  default     = ""
}

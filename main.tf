resource "google_compute_global_address" "private_ip_address" {
  name          = "${var.env}-${var.product_base_name}-private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = var.network
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]

  depends_on = [google_compute_global_address.private_ip_address]
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "sql_instance" {
  name             = "${var.env}-${var.product_base_name}-${random_id.db_name_suffix.hex}-sql"
  region           = var.region
  database_version = "SQLSERVER_2019_EXPRESS"
  root_password    = var.root_passwd

  settings {
    tier = "db-custom-4-3840"
    ip_configuration {
      ipv4_enabled       = false
      private_network    = var.network
      require_ssl        = true
      allocated_ip_range = google_compute_global_address.private_ip_address.name
    }
    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
    user_labels = {
      "iacda_gcp_pbn" = var.product_base_name
      "iacda_gcp_env" = var.env
      "iacda_gcp_res" = "sql_database_instance"
    }

  }
  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]
}


resource "google_sql_user" "user" {
  name     = var.user
  instance = google_sql_database_instance.sql_instance.name
  password = var.passwd
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "${var.env}-${var.product_base_name}-private-ip-address"
  purpose       = var.purpose
  address_type  = var.address_type
  prefix_length = var.prefix_length
  network       = var.network
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.network
  service                 = var.service
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]

  depends_on = [google_compute_global_address.private_ip_address]
}

resource "random_id" "db_name_suffix" {
  byte_length = 5
}

resource "google_sql_database_instance" "sql_instance" {
  name             = "${var.env}-${var.product_base_name}-${random_id.db_name_suffix.hex}-sql"
  region           = var.region
  database_version = var.db_version
  root_password    = var.root_passwd

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled       = var.public_ip
      private_network    = var.network
      require_ssl        = var.require_ssl
      allocated_ip_range = google_compute_global_address.private_ip_address.name
    }
    dynamic "database_flags" {
      for_each = var.database_flags

      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }
    user_labels = var.labels

  }
  deletion_protection = var.deletion_protection

  depends_on = [google_service_networking_connection.private_vpc_connection]
}


resource "google_sql_user" "user" {
  count    = length(var.user) == 0 ? 0 : 1
  name     = var.user
  instance = google_sql_database_instance.sql_instance.name
  password = var.passwd
}

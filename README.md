# Google Cloud SQL Terraform module
Terraform module for creation Google Cloud SQL resources

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google)          | = 4.24.0 |
| <a name="requirement_random"></a> [random](#requirement\_random)          | = 3.4.3  |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.24.0  |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3   |

## Modules
No modules.

## Resources
| Name                                                                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/4.24.0/docs/resources/sql_user)                                                            | resource |
| [google_compute_global_address.private_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address)                   | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database_instance.sql_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)                           | resource |
| [google_project_iam_member.sql](https://registry.terraform.io/providers/hashicorp/google/4.24.0/docs/resources/google_project_iam)                                          | resource |
| [random_string.sqluser_passwd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                                       | resource |
| [random_id.db_name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id)                                                               | resource |



## Inputs
| Name                                                                                          | Description                                                                                                                                           | Type          | Default                            | Required |
| --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ---------------------------------- | :------: |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)                            | The ID of the project in which the resource belongs.                                                                                                  | `string`      | n/a                                |   yes    |
| <a name="input_region"></a> [region](#input\_region)                                          | The location or cloud resources region for the environment.                                                                                           | `string`      | n/a                                |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name)     | Cloud resources base name (used to create services).                                                                                                  | `string`      | n/a                                |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                                   | Variable to mark the environment of the resource (used to create services).                                                                           | `string`      | n/a                                |   yes    |
| <a name="input_users"></a> [users](#input\_users)                                             | Names of SQL instance users.                                                                                                                          | `map(string)` | {}                                 |    no    |
| <a name="input_network"></a> [network](#input\_network)                                       | The VPC network from which the Cloud SQL instance is accessible for private IP.                                                                       | `string`      | n/a                                |   yes    |
| <a name="input_purpose"></a> [purpose](#input\_purpose)                                       | The purpose of the resource. VPC_PEERING or PRIVATE_SERVICE_CONNECT.                                                                                  | `string`      | "VPC_PEERING"                      |    no    |
| <a name="input_address_type"></a> [address\_type](#input\_address\_type)                      | The type of the address to reserve. EXTERNAL or INTERNAL.                                                                                             | `string`      | "INTERNAL"                         |    no    |
| <a name="input_prefix_length"></a> [prefix\_length](#input\_prefix\_length)                   | The prefix length of the IP range. For more see google_compute_global_address resource description.                                                   | `number`      | "24"                               |    no    |
| <a name="input_service"></a> [service](#input\_service)                                       | Provider peering service that is managing peering connectivity for a service provider organization.                                                   | `string`      | "servicenetworking.googleapis.com" |    no    |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version)                            | The MySQL, PostgreSQL or SQL Server version to use (see the description of the google_sql_database_instance resource).                                | `string`      | "SQLSERVER_2019_EXPRESS"           |    no    |
| <a name="input_tier"></a> [tier](#input\_tier)                                                | The machine type to use.                                                                                                                              | `string`      | n/a                                |   yes    |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip)                               | Whether this Cloud SQL instance should be assigned a public IPV4 address. At least public_ip must be enabled or a private_network must be configured. | `bool`        | false                              |    no    |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl)                         | Whether SSL connections over IP are enforced or not.                                                                                                  | `bool`        | true                               |    no    |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags)                | Cloud SQL instance settinngs flags.                                                                                                                   | `map(any)`    | {}                                 |    no    |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether or not to allow Terraform to destroy the instance. To protect SQL instence set true.                                                          | `bool`        | false                              |    no    |
| <a name="input_sqlsa_roles"></a> [sqlsa\_roles](#input\_sqlsa\_roles)                         | The role that should be applied for SQL service account.                                                                                              | `set(string)` | []                                 |    no    |
| <a name="input_labels"></a> [labels](#input\_labels)                                          | A set of key/value user label pairs to assign to the instance.                                                                                        | `map(string)` | {}                                 |    no    |

## Outputs
| Name                                                                                        | Description                                                     |
| ------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| <a name="output_sql_instance_ip"></a> [sql\_instance\_ip](#output\_sql\_instance\_ip)       | The first private IPv4 address assigned to sql instance.        |
| <a name="output_sql_instance_name"></a> [sql\_instance\_name](#output\_sql\_instance\_name) | The sql instance name.                                          |
| <a name="output_sql_service_acc"></a> [sql\_service\_acc](#output\_dp\_serverless\_secret)  | The service account email address assigned to the sql instance. |
| <a name="output_users_creds"></a> [users\_creds](#output\_users\_creds)                     | Passwords for provided users.                                   |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-sql/blob/main/LICENSE)

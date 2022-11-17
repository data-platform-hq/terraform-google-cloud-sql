# Google Cloud SQL Terraform module
Terraform module for creation Google Cloud SQL resources

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.43.0 |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.0  |

## Modules
No modules.

## Resources
| Name                                                                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_compute_global_address.private_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address)                   | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database_instance.sql_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)                           | resource |
| [google_sql_user.user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user)                                                             | resource |
| [random_id.db_name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id)                                                               | resource |



## Inputs
| Name                                                                                      | Description                                                                    | Type       | Default                                                                                                                     | Required |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ---------- | --------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_region"></a> [region](#input\_region)                                      | The location or cloud resources region for the environment                     | `string`   | <pre><br>us-west1</pre>                                                                                                     |   yes    |
| <a name="input_subnet"></a> [subnet](#input\_subnet)                                      | The subnet from which the Cloud SQL instance is accessible for private IP      | `string`   | n/a                                                                                                                         |   yes    |
| <a name="input_network"></a> [network](#input\_network)                                   | The VPC network from which the Cloud SQL instance is accessible for private IP | `string`   | n/a                                                                                                                         |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)                            | `string`   | n/a                                                                                                                         |   yes    |
| <a name="input_root_passwd"></a> [root\_passwd](#input\_root\_passwd)                     | The password for the root                                                      | `string`   | n/a                                                                                                                         |   yes    |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags)            | Cloud SQL instance settinngs flags                                             | `map(any)` | <pre>{<br> "user connections"      = "15"<br> "default trace enabled" = "on"<br> "remote access"         = "off"<br>}</pre> |    no    |
| <a name="input_user"></a> [user](#input\_user)                                            | The name of the SQL instance user                                              | `string`   | n/a                                                                                                                         |   yes    |
| <a name="input_passwd"></a> [passwd](#input\_passwd)                                      | The password of the SQL instance user                                          | `string`   | n/a                                                                                                                         |   yes    |


## Outputs
| Name                                                                                        | Description                                                    |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| <a name="output_sql_instance_ip"></a> [sql\_instance\_ip](#output\_sql\_instance\_ip)       | The first private IPv4 address assigned to sql instance        |
| <a name="output_sql_instance_name"></a> [sql\_instance\_name](#output\_sql\_instance\_name) | The sql instance name                                          |
| <a name="output_sql_service_acc"></a> [sql\_service\_acc](#output\_dp\_serverless\_secret)  | The service account email address assigned to the sql instance |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-sql/blob/main/LICENSE)

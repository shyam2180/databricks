terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">=0.4.0"
    }
  }
}
provider "databricks" {
  host  = "https://dbc-ff4a8e7c-a0e4.cloud.databricks.com/"
  token = "dapidbbacbbe2594b133eb06cf028d114f47"
}

# # Databricks cluster resource definition To create a cluster
# resource "databricks_cluster" "main" {
#   # Configure cluster settings
#   cluster_name            = "DE-cluster"
#   spark_version           = "13.3.x-scala2.12"
#   node_type_id            = "i3.xlarge"
#   num_workers             = 2
#   autotermination_minutes = 10
# }

data "databricks_current_user" "current_user" {}

data "databricks_spark_version" "latest" {}

data "databricks_node_type" "smallest" {
  local_disk = true
}

resource "databricks_notebook" "this" {
  path           = "/Users/shyamkumarr@jmangroup.com/cicd1"
  language       = "PYTHON"
  content_base64 = base64encode(<<-EOT
    # created from ${abspath(path.module)}
    display(spark.range(10))
  EOT
  )
}

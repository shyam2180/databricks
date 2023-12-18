# Configure Databricks provider
terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.0"  # Specify the version you want to use
    }
  }
}
provider "databricks" {
  host  = "https://dbc-ff4a8e7c-a0e4.cloud.databricks.com/"
  token = "dapidbbacbbe2594b133eb06cf028d114f47"
}
 
# Databricks workspace resource definition
resource "databricks_workspace" "example" {
  # Configure workspace settings
  name = "/Repos/shyamkumarr@jmangroup.com/databricks/cicd"
}
 
# Databricks cluster resource definition
resource "databricks_cluster" "example" {
  # Configure cluster settings
  cluster_name            = "DE-cluster"
  spark_version           = "13.3.x-scala2.12"
  node_type_id            = "i3.xlarge"
  num_workers             = 2
  autotermination_minutes = 10
}
 
# Databricks Notebook resource definition
resource "databricks_notebook" "example_notebook" {
  # Configure notebook settings
  name    = "my_notebook"
  path    = databricks_workspace.example.path
  content = file("C:\\Users\\AravindaNarayana\\Desktop\\test_cicd_output\\ci_cd.py.txt")
}

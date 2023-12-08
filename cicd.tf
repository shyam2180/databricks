# Databricks provider configuration
provider "databricks" {
  host  = "https://dbc-ff4a8e7c-a0e4.cloud.databricks.com/"
  token = dapidbbacbbe2594b133eb06cf028d114f47
}
 
# Databricks workspace resource definition
resource "databricks_workspace" "example" {
  # Configure workspace settings
  workspace_name = "/Repos/shyamkumarr@jmangroup.com/databricks/cicd"
}
 
# Databricks cluster resource definition
resource "databricks_cluster" "example" {
  # Configure cluster settings
  cluster_name            = "DE-cluster"
  spark_version           = "13.3.x-photon-scala2.12"
  node_type_id            = "i3.xlarge"
  num_workers             = 2
  autotermination_minutes = 10
}
 
# Databricks Library (Additional Resource)
resource "databricks_library" "example_library" {
  # Configure library settings
cluster_id = databricks_cluster.example.id
  library_name   = "my-library"
  jar            = "dbfs:/mnt/my-bucket/my-library.jar"
  # Add more library configurations as needed
}
 
# Databricks Notebook resource definition
resource "databricks_notebook" "example_notebook" {
  # Configure notebook settings
  name    = "my-notebook"
  content = file("C:\Users\ShyamKumarR\test_cicd_output\ci_cd.py") # Replace with your local notebook path
}

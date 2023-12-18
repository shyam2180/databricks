# Configure Databricks provider
terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "1.6.6"  # Specify the version you want to use
    }
  }
}
 

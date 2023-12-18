# Configure Databricks provider
terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.0"  # Specify the version you want to use
    }
  }
}
 

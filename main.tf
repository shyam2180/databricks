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

provider "azurerm" {
  features {
    managed_disk {
      expand_without_downtime = true
    }
  }
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

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "standard
}
 

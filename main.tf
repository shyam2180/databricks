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
  # Configure the Databricks provider with the required credentials
  # More information: https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs/index.html#provider-configuration
  token                    = "dapidbbacbbe2594b133eb06cf028d114f47"
  workspace_url            = "https://dbc-ff4a8e7c-a0e4.cloud.databricks.com"
}

resource "databricks_workspace" "main" {
  # main workspace configuration
  name = "main"
}

resource "databricks_workspace" "prod" {
  # Prod workspace configuration
  name = "prod"
}

# Upload Python file to main workspace
resource "null_resource" "upload_python_file" {
  provisioner "local-exec" {
    command = "databricks workspace import -l /Local/Path/To/Your/PythonScript.py /Workspace/Path/In/main"
  }

  depends_on = [databricks_workspace.main]
}

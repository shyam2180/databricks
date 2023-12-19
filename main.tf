# Configure Databricks provider
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">=0.4.0"  # Specify the version you want to use
    }
  }
}
provider "databricks" {
  host  = "https://dbc-ff4a8e7c-a0e4.cloud.databricks.com/"
  token = "dapidbbacbbe2594b133eb06cf028d114f47"
}

resource "databricks" "main" {
  # main workspace configuration
  name = "main"
  version = ">=0.4.0"
}

# Upload Python file to main workspace
resource "null_resource" "upload_python_file" {
  provisioner "local-exec" {
    command = "databricks workspace import -l /Local/Path/To/Your/PythonScript.py /Workspace/Path/In/main"
  }

  depends_on = [databricks_workspace.main]
}

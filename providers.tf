terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.9.2"
    }
  }

  backend "s3" {
    bucket = "statefilebucketcubx"
    region = "us-east-1"
    key = "repo.tfstate"
    dynamodb_table = "test_dynamo111"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  client_id     = var.CLIENT_ID1
  client_secret = var.CLIENT_SECRET1
  account_id = var.ACCOUNT_ID
}
provider "databricks" {
  alias = "accounts"
  host = "https://accounts.cloud.databricks.com"
  #    client_id = "ff089d9f-ab47-4591-93d0-c9f603455839"
  #    client_secret = " dose4cb65bc38bf2bee8c306865bfe455a22"
  username = var.databricks_account_username
  password = var.databricks_account_password
  account_id = var.ACCOUNT_ID
}
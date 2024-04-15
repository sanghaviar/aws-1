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
    key = "repo1.tfstate"
    dynamodb_table = "test_dynamo111"
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

}

provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  access_key     = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  account_id = var.ACCOUNT_ID
}
provider "databricks" {
  alias = "accounts"
  host = "https://accounts.cloud.databricks.com"
  #    client_id = "ff089d9f-ab47-4591-93d0-c9f603455839"
  #    client_secret = " dose4cb65bc38bf2bee8c306865bfe455a22"
  username = var.DATABRICKS_ACCOUNT_USERNAME
  password = var.DATABRICKS_ACCOUNT_PASSWORD
  account_id = var.ACCOUNT_ID
}
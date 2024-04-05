terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
#    databricks = {
#      source  = "databricks/databricks"
#      version = ">=1.9.2"
#    }
  }

  backend "s3" {
    bucket = "statefilebucketcubx"
    region = "us-east-1"
    key = "repo.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}



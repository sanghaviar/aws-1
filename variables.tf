variable "AWS_ACCESS_KEY_ID" {
}

variable "AWS_SECRET_ACCESS_KEY" {
}

variable "DATABRICKS_CLIENT_ID" {
  type = string
}

variable "DATABRICKS_CLIENT_SECRET" {
  type = string
}

variable "ACCOUNT_ID" {}

variable "region" {
  default = "us-east-1"
}

#variable "DATABRICKS_ACCOUNT_USERNAME" {}
#variable "DATABRICKS_ACCOUNT_PASSWORD" {}

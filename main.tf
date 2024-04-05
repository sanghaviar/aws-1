locals {
  data    = jsondecode(file("${path.module}/config/config.json"))
}
module "s3_bucket" {
  providers = {
    databricks = databricks.accounts
  }
  source = "../modules/s3"
  for_each      = {for entry in local.data["s3"] : entry["aws_s3_bucket_name"] => entry}
  config = each.value
  ACCOUNT_ID = var.ACCOUNT_ID
}

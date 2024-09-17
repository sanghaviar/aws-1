locals {
  data    = jsondecode(file("${path.module}/config/config.json"))
}
module "iam_role" {
  providers = {
    databricks= databricks.accounts
  }
  source = "./modules-1/aws_res/iam"
  for_each      = {for entry in local.data["iam_role"] : entry["aws_iam_role_name"] => entry}
  config = each.value
  ACCOUNT_ID = var.ACCOUNT_ID
}
module "cross_account" {
  source = "./modules-1/aws_res/cross_account"
  for_each      = {for entry in local.data["iam_crossaccount"] : entry["iam_role_name"] => entry}
  config = each.value
  depends_on = [module.iam_role]
}

module "s3_bucket" {
  source = "./modules-1/aws_res/s3"
  for_each      = {for entry in local.data["s3"] : entry["aws_s3_bucket_name"] => entry}
  config = each.value
}
module "iam_role_policy" {
   source = "./modules-1/aws_res/iam_role_policy"
  for_each      = {for entry in local.data["iam_role_policy"] : entry["iam_role_name"] => entry}
  config = each.value
  depends_on = [module.s3_bucket]
}
#module "db_workspace" {
#  providers = {
#    databricks = databricks.accounts
#  }
#  source = "./modules/aws_res/workspace"
#  for_each      = {for entry in local.data["db_workspace"] : entry["storage_configuration_name"] => entry}
#  config = each.value
#  ACCOUNT_ID = var.ACCOUNT_ID
#  region = var.region
#  depends_on = [module.iam_role]
#}

#module "kms" {
#  source = "./modules/aws_res/kms"
#  for_each      = {for entry in local.data["kms"] : entry["description_name"] => entry}
#  config = each.value
#  depends_on = [module.iam_role]
#}
#
#module "asm" {
#  source = "./modules/aws_res/asm"
#  for_each      = {for entry in local.data["asm"] : entry["name"] => entry}
#  config = each.value
#  depends_on = [module.iam_role]
#}



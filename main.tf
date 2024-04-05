locals {
  data    = jsondecode(file("${path.module}/config/config.json"))
}
module "s3_bucket" {
  source = "./modules/aws_res/s3"
  for_each      = {for entry in local.data["s3"] : entry["aws_s3_bucket_name"] => entry}
  config = each.value
}
#s3



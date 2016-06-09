provider "aws" {
  region = "${var.provider_region}"
}

module "nat" {
  source = "../app-nat"

  provider_region = "${var.provider_region}"
  bucket_remote_state = "${var.bucket_remote_state}"
  context_org = "${var.context_org}"
  context_env = "${var.context_env}"

  az_count = "${var.az_count}" 

  cidr_blocks = "${var.cidr_blocks}"
}

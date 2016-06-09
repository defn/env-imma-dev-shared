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

resource "aws_eip" "nat" {
  vpc = true

  count = "${var.az_count}"
}

resource "aws_nat_gateway" "nat" {
  count = "${var.az_count}"

  subnet_id = "${element(split(" ", module.nat.subnet_ids), count.index)}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
}

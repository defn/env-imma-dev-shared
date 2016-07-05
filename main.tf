variable "az_count"     { default = 2 }

provider "aws" { }

resource "null_resource" "cidrs" {
  triggers = {
    consul = "${data.terraform_remote_state.env.vpc_net16}.0.160/28 ${data.terraform_remote_state.env.vpc_net16}.0.176/28"
  }
}

module "consul" {
  source = "../app-consul"

  bucket_remote_state = "${var.bucket_remote_state}"
  context_org = "${var.context_org}"
  context_env = "${var.context_env}"

  cidr_blocks = "${split(" ",null_resource.cidrs.triggers.consul)}"

  az_count = "${var.az_count}"

  app_name = "consul"
}

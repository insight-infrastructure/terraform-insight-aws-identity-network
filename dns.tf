data "aws_route53_zone" "this" {
  count = var.root_domain_name == "" ? 0 : 1
  name = "${var.root_domain_name}."
}

locals {
  create_internal_domain = var.all_enabled ? true : var.create_internal_domain
}

resource "aws_route53_zone" "root_private" {
  count = local.create_internal_domain ? 1 : 0
  name = "${var.namespace}.${var.internal_tld}."

  vpc {
    vpc_id = module.vpc.vpc_id
    vpc_region = data.aws_region.current.name
  }

  tags = merge(var.tags, {
    "Region" = data.aws_region.current.name,
    "ZoneType" = "Private"
  })
}


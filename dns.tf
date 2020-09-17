######
# DNS
######
variable "internal_tld" {
  description = "The top level domain for the internal DNS"
  type        = string
  default     = "internal"
}

variable "create_internal_domain" {
  description = "Boolean to create an internal split horizon DNS"
  type        = bool
  default     = false
}

variable "create_public_regional_subdomain" {
  description = "Boolean to create regional subdomain - ie us-east-1.example.com"
  type        = bool
  default     = false
}

variable "zone_id" {
  description = "The zone ID to configure as the root zoon - ie subdomain.example.com's zone ID"
  type        = string
  default     = ""
}

data "aws_route53_zone" "this" {
  count = var.domain_name == "" ? 0 : 1
  name  = "${var.domain_name}."
}

locals {
  create_internal_domain = var.all_enabled ? true : var.create_internal_domain
}

resource "aws_route53_zone" "root_private" {
  count = local.create_internal_domain ? 1 : 0
  name  = "${var.namespace}.${var.internal_tld}."

  vpc {
    vpc_id     = module.vpc.vpc_id
    vpc_region = data.aws_region.current.name
  }

  tags = merge(var.tags, {
    "Region"   = data.aws_region.current.name,
    "ZoneType" = "Private"
  })
}


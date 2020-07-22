

locals {
  id = var.name

  bastion_enabled    = var.all_enabled ? true : var.bastion_enabled
  consul_enabled     = var.all_enabled ? true : var.consul_enabled
  hids_enabled       = var.all_enabled ? true : var.hids_enabled
  logging_enabled    = var.all_enabled ? true : var.logging_enabled
  monitoring_enabled = var.all_enabled ? true : var.monitoring_enabled
  vault_enabled      = var.all_enabled ? true : var.vault_enabled

  cloudflare_enable = var.all_enabled ? true : var.cloudflare_enable && var.root_domain_name != "" && var.subdomain == ""

  create_public_regional_subdomain = var.cloudflare_enable ? true : var.create_public_regional_subdomain
  create_internal_domain           = var.all_enabled ? true : var.create_internal_domain
}

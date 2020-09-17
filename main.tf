
terraform {
  required_version = ">= 0.12"
}

data "aws_region" "current" {}

locals {
  id = var.id == "" ? var.name : var.id

  bastion_enabled    = var.all_enabled ? true : var.bastion_enabled
  consul_enabled     = var.all_enabled ? true : var.consul_enabled
  hids_enabled       = var.all_enabled ? true : var.hids_enabled
  logging_enabled    = var.all_enabled ? true : var.logging_enabled
  monitoring_enabled = var.all_enabled ? true : var.monitoring_enabled
  vault_enabled      = var.all_enabled ? true : var.vault_enabled
}

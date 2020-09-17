variable "cloudflare_enable" {
  description = "Make records in cloudflare"
  type        = bool
  default     = false
}

variable "create" {
  description = "Bool to create"
  type        = bool
  default     = true
}

########
# Label
########
variable "name" {
  description = "The name of the deployment"
  type        = string
  default     = "polkadot-api"
}

variable "tags" {
  description = "The tags of the deployment"
  type        = map(string)
  default     = {}
}

variable "id" {
  description = "Unique string identifier"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace for internal dns"
  type        = string
  default     = "insight"
}

##################
# Security Groups
##################
variable "all_enabled" {
  description = "Bool to enable all the security groups"
  type        = bool
  default     = false
}

variable "corporate_ip" {
  description = "The corporate IP you want to restrict ssh traffic to"
  type        = string
  default     = ""
}

variable "bastion_enabled" {
  description = "Boolean to enable a bastion host.  All ssh traffic restricted to bastion"
  type        = bool
  default     = false
}

variable "consul_enabled" {
  description = "Boolean to allow consul traffic"
  type        = bool
  default     = false
}

variable "hids_enabled" {
  description = "Boolean to enable intrusion detection systems traffic"
  type        = bool
  default     = false
}

variable "logging_enabled" {
  description = "Boolean to allow logging related traffic"
  type        = bool
  default     = false
}

variable "monitoring_enabled" {
  description = "Boolean to for prometheus related traffic"
  type        = bool
  default     = false
}

variable "vault_enabled" {
  description = "Boolean to allow vault related traffic"
  type        = bool
  default     = false
}

variable "sentry_sg_name" {
  description = "Name for the public node security group"
  type        = string
  default     = "sentry-sg"
}

variable "bastion_sg_name" {
  description = "Name for the bastion security group"
  type        = string
  default     = "bastion-sg"
}

variable "consul_sg_name" {
  description = "Name for the consult security group"
  type        = string
  default     = "consul-sg"
}

variable "vault_sg_name" {
  description = "Name for the vault security group"
  type        = string
  default     = "vault-sg"
}

##############
# External SGs
##############
variable "hids_sg_id" {
  description = "The id of the HIDs security group"
  type        = string
  default     = ""
}

variable "monitoring_sg_id" {
  description = "The id of the monitoring security group"
  type        = string
  default     = ""
}

variable "logging_sg_id" {
  description = "The id of the logging security group"
  type        = string
  default     = ""
}

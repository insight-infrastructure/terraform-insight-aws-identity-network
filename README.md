# terraform-aws-insight-network

[![open-issues](https://img.shields.io/github/issues-raw/insight-infrastructure/terraform-aws-insight-network?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-insight-network/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-infrastructure/terraform-aws-insight-network?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-insight-network/pulls)

## Features

This module sets up a network for [github.com/insight-infrastructure/terragrunt-insight](github.com/insight-infrastructure/terragrunt-insight).

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
module "this" {
  source = "github.com/insight-infrastructure/terraform-aws-insight-network"
}
```
## Examples

- [defaults](https://github.com/insight-infrastructure/terraform-aws-insight-network/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| cloudflare | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| all\_enabled | Bool to enable all the security groups | `bool` | `false` | no |
| azs | List of availability zones | `list(string)` | `[]` | no |
| bastion\_enabled | Boolean to enable a bastion host.  All ssh traffic restricted to bastion | `bool` | `false` | no |
| bastion\_sg\_name | Name for the bastion security group | `string` | `"bastion-sg"` | no |
| cidr | The cidr range for network | `string` | `"10.0.0.0/16"` | no |
| cloudflare\_enable | Make records in cloudflare | `bool` | `false` | no |
| consul\_enabled | Boolean to allow consul traffic | `bool` | `false` | no |
| consul\_sg\_name | Name for the consult security group | `string` | `"consul-sg"` | no |
| corporate\_ip | The corporate IP you want to restrict ssh traffic to | `string` | `""` | no |
| create\_internal\_domain | Boolean to create an internal split horizon DNS | `bool` | `false` | no |
| create\_public\_regional\_subdomain | Boolean to create regional subdomain - ie us-east-1.example.com | `bool` | `false` | no |
| hids\_enabled | Boolean to enable intrusion detection systems traffic | `bool` | `false` | no |
| hids\_sg\_id | The id of the HIDs security group | `string` | `""` | no |
| internal\_tld | The top level domain for the internal DNS | `string` | `"internal"` | no |
| logging\_enabled | Boolean to allow logging related traffic | `bool` | `false` | no |
| logging\_sg\_id | The id of the logging security group | `string` | `""` | no |
| monitoring\_enabled | Boolean to for prometheus related traffic | `bool` | `false` | no |
| monitoring\_sg\_id | The id of the monitoring security group | `string` | `""` | no |
| name | The name of the deployment | `string` | `"polkadot-api"` | no |
| namespace | The namespace of the deployment | `string` | `"insight"` | no |
| num\_azs | The number of AZs to deploy into | `number` | `0` | no |
| root\_domain\_name | The public domain | `string` | `""` | no |
| sentry\_sg\_name | Name for the public node security group | `string` | `"sentry-sg"` | no |
| subdomain | n/a | `string` | `""` | no |
| tags | The tags of the deployment | `map(string)` | `{}` | no |
| vault\_enabled | Boolean to allow vault related traffic | `bool` | `false` | no |
| vault\_sg\_name | Name for the vault security group | `string` | `"vault-sg"` | no |
| vpc\_name | The name of the VPC | `string` | `""` | no |
| zone\_id | The zone ID to configure as the root zoon - ie subdomain.example.com's zone ID | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| azs | n/a |
| bastion\_security\_group\_id | #### SGs #### |
| consul\_security\_group\_id | n/a |
| internal\_tld | n/a |
| private\_subnets | n/a |
| private\_subnets\_cidr\_blocks | n/a |
| public\_regional\_domain | n/a |
| public\_subnet\_cidr\_blocks | n/a |
| public\_subnets | n/a |
| root\_domain\_name | #### DNS #### |
| vault\_security\_group\_id | n/a |
| vpc\_id | #### VPC #### |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-infrastructure](https://github.com/insight-infrastructure)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.
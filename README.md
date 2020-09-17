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
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| all\_enabled | Bool to enable all the security groups | `bool` | `false` | no |
| allow\_ssh\_commands | Allows the SSH user to execute one-off commands. Pass 'True' to enable. Warning: These commands are not logged and increase the vulnerability of the system. Use at your own discretion. | `string` | `""` | no |
| azs | List of availability zones | `list(string)` | `[]` | no |
| bastion\_enabled | Boolean to enable a bastion host.  All ssh traffic restricted to bastion | `bool` | `false` | no |
| bastion\_host\_name | The hostname for bastion | `string` | `"bastion"` | no |
| bastion\_monitoring\_enabled | Cloudwatch monitoring on bastion | `bool` | `true` | no |
| bastion\_sg\_name | Name for the bastion security group | `string` | `"bastion-sg"` | no |
| bucket\_force\_destroy | The bucket and all objects should be destroyed when using true | `bool` | `true` | no |
| bucket\_name | Bucket name were the bastion will store the logs | `string` | `""` | no |
| bucket\_versioning | Enable bucket versioning or not | `bool` | `true` | no |
| cidr | The cidr range for network | `string` | `"10.0.1.0/16"` | no |
| cloudflare\_enable | Make records in cloudflare | `bool` | `false` | no |
| consul\_enabled | Boolean to allow consul traffic | `bool` | `false` | no |
| consul\_sg\_name | Name for the consult security group | `string` | `"consul-sg"` | no |
| corporate\_ip | The corporate IP you want to restrict ssh traffic to | `string` | `""` | no |
| create | Bool to create | `bool` | `true` | no |
| create\_internal\_domain | Boolean to create an internal split horizon DNS | `bool` | `false` | no |
| create\_public\_regional\_subdomain | Boolean to create regional subdomain - ie us-east-1.example.com | `bool` | `false` | no |
| domain\_name | #### DNS #### | `string` | `""` | no |
| enable\_bastion | Bool to enable bastion | `bool` | `true` | no |
| enable\_prometheus | Enable prometheus monitoring | `bool` | `true` | no |
| extra\_user\_data\_content | Additional scripting to pass to the bastion host. For example, this can include installing postgresql for the `psql` command. | `string` | `""` | no |
| hids\_enabled | Boolean to enable intrusion detection systems traffic | `bool` | `false` | no |
| hids\_sg\_id | The id of the HIDs security group | `string` | `""` | no |
| id | Unique string identifier | `string` | `""` | no |
| instance\_type | The instance type of the bastion instances. | `string` | `"t2.nano"` | no |
| internal\_tld | The top level domain for the internal DNS | `string` | `"internal"` | no |
| log\_auto\_clean | Enable or not the lifecycle | `bool` | `false` | no |
| log\_expiry\_days | Number of days before logs expiration | `number` | `90` | no |
| log\_glacier\_days | Number of days before moving logs to Glacier | `number` | `60` | no |
| log\_standard\_ia\_days | Number of days before moving logs to IA Storage | `number` | `30` | no |
| logging\_enabled | Boolean to allow logging related traffic | `bool` | `false` | no |
| logging\_sg\_id | The id of the logging security group | `string` | `""` | no |
| monitoring\_enabled | Boolean to for prometheus related traffic | `bool` | `false` | no |
| monitoring\_sg\_id | The id of the monitoring security group | `string` | `""` | no |
| name | The name of the deployment | `string` | `"polkadot-api"` | no |
| namespace | Namespace for internal dns | `string` | `"insight"` | no |
| num\_azs | The number of AZs to deploy into | `number` | `0` | no |
| private\_subnets | private\_subnets cidr blocks | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| public\_key\_paths | List of paths to public ssh keys | `list(string)` | `[]` | no |
| public\_ssh\_port | Set the SSH port to use from desktop to the bastion | `number` | `22` | no |
| public\_subnets | public\_subnets cidr blocks | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24"<br>]</pre> | no |
| sentry\_sg\_name | Name for the public node security group | `string` | `"sentry-sg"` | no |
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
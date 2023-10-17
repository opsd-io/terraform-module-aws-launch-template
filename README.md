<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

Terraform module which creates a launch template that contains the configuration information to launch an instance.

## Usage

```hcl
module "launch_template_amd64" {
  source = "../modules/terraform-module-aws-launch-template"

  name                               = "foo-amd64"
  image_id                           = "ami-0a0956a3bacfbf233"
  vpc_security_group_ids             = ["sg-09d49e22dafd43e23", "sg-0ea844093e906d7fg"]
  user_data                          = "IyEvYmluL2Jhc2gKI0ZvciB1c2Ugd2l0aCB0aGUgQVNHIHVzZXIgZGF0YSBzZWN0aW9uIG9mIExhdW5jaCBDb25maWdzIHB1c2ggbXExClNUQVJUVElNRT0k"
  key_name                           = "mykey"
  iam_instance_profile               = "myprofile"
}

```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_launch_template.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, used EC2 instance will be EBS-optimized | `bool` | `false` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | The IAM Instance Profile to launch the instance with. | <pre>object({<br>    name = optional(string)<br>    arn  = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The name of the AMI. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The Name of ssh public key to add to ec2-user account. | `string` | n/a | yes |
| <a name="input_launch_template_description"></a> [launch\_template\_description](#input\_launch\_template\_description) | Description of the launch template. | `string` | `null` | no |
| <a name="input_launch_template_version"></a> [launch\_template\_version](#input\_launch\_template\_version) | A version of the launch template | `string` | `"$Default"` | no |
| <a name="input_metadata_options"></a> [metadata\_options](#input\_metadata\_options) | Customize the metadata options for the instance. | <pre>object({<br>    http_endpoint               = optional(string)<br>    http_tokens                 = optional(string)<br>    http_put_response_hop_limit = optional(number)<br>    http_protocol_ipv6          = optional(string)<br>    instance_metadata_tags      = optional(string)<br>  })</pre> | <pre>{<br>  "instance_metadata_tags": "enabled"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the launch template. | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | A list of network interfaces to be attached to the instance. | <pre>list(object({<br>    associate_carrier_ip_address = optional(bool),<br>    associate_public_ip_address  = optional(bool),<br>    delete_on_termination        = optional(string),<br>    description                  = optional(string),<br>    device_index                 = optional(string),<br>    interface_type               = optional(string),<br>    ipv4_addresses               = optional(list(string), []),<br>    ipv4_address_count           = optional(number),<br>    ipv6_addresses               = optional(list(string), []),<br>    ipv6_address_count           = optional(string),<br>    network_interface_id         = optional(string),<br>    private_ip_address           = optional(string),<br>    security_groups              = optional(string),<br>    subnet_id                    = optional(string),<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The Tags to to apply to the launch template, EC2, volume, network interface. | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to pass to the instance at launch time. | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group IDs to assign to. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the launch template. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the launch template. |
| <a name="output_name"></a> [name](#output\_name) | Amazon Resource Name (ARN) of the launch template. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)

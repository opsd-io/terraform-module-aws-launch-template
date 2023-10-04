variable "name" {
  description = "The name of the launch template."
  type        = string
}

variable "launch_template_description" {
  description = "Description of the launch template."
  type        = string
  default     = null
}

variable "launch_template_version" {
  description = "A version of the launch template"
  type        = string
  default     = "$Default"
}

variable "image_id" {
  description = "The name of the AMI."
  type        = string
}

variable "key_name" {
  description = "The Name of ssh public key to add to ec2-user account."
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with."
  type = object({
    name = optional(string)
    arn  = optional(string)
  })
}

variable "network_interfaces" {
  description = "A list of network interfaces to be attached to the instance."
  type = list(object({
    associate_carrier_ip_address = optional(bool),
    associate_public_ip_address  = optional(bool),
    delete_on_termination        = optional(string),
    description                  = optional(string),
    device_index                 = optional(string),
    interface_type               = optional(string),
    ipv4_addresses               = optional(list(string), []),
    ipv4_address_count           = optional(number),
    ipv6_addresses               = optional(list(string), []),
    ipv6_address_count           = optional(string),
    network_interface_id         = optional(string),
    private_ip_address           = optional(string),
    security_groups              = optional(string),
    subnet_id                    = optional(string),
  }))
  default = []
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to assign to."
  type        = list(string)
  default     = []
}

variable "ebs_optimized" {
  description = "If true, used EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "The type of the instance."
  type        = string
  default     = null
}

variable "metadata_options" {
  description = "Customize the metadata options for the instance."
  type = object({
    http_endpoint               = optional(string)
    http_tokens                 = optional(string)
    http_put_response_hop_limit = optional(number)
    http_protocol_ipv6          = optional(string)
    instance_metadata_tags      = optional(string)
  })
  default = {
    instance_metadata_tags = "enabled"
  }
}

variable "user_data" {
  description = "The user data to pass to the instance at launch time."
  type        = string
  default     = null
}

variable "launch_template_tag_specifications" {
  description = "Tags being added to EC2, volume and network interface."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to assign to the launch template."
  type        = map(string)
  default     = {}
}

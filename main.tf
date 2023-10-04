resource "aws_launch_template" "main" {
  name                   = var.name
  description            = var.launch_template_description
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  ebs_optimized          = var.ebs_optimized
  user_data              = var.user_data
  vpc_security_group_ids = var.vpc_security_group_ids

  dynamic "network_interfaces" {
    for_each = var.network_interfaces

    content {
      associate_public_ip_address = network_interfaces.value.associate_public_ip_address
      private_ip_address          = network_interfaces.value.private_ip_address
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile != null ? [var.iam_instance_profile] : []
    content {
      name = var.iam_instance_profile.name
      arn  = var.iam_instance_profile.arn
    }
  }

  dynamic "metadata_options" {
    for_each = var.metadata_options != null ? [var.metadata_options] : []
    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_tokens                 = metadata_options.value.http_tokens
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags
    }
  }

  dynamic "tag_specifications" {
    for_each = toset(["instance", "volume", "network-interface"])
    content {
      resource_type = tag_specifications.key
      tags          = var.launch_template_tag_specifications
    }
  }

  tags = var.tags
}

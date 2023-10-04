module "module_name" {
  source = "../../"

}


locals {
  name = "foo"
  tags = { Name = "foo", Env = "prd" }
}


module "launch_template_amd64" {
  source = "../modules/terraform-module-aws-launch-template"

  name                               = "${local.name}-amd64"
  image_id                           = "ami-0a0956a3bacfbf233"
  vpc_security_group_ids             = ["sg-09d49e22dafd43e23", "sg-0ea844093e906d7fg"]
  user_data                          = "IyEvYmluL2Jhc2gKI0ZvciB1c2Ugd2l0aCB0aGUgQVNHIHVzZXIgZGF0YSBzZWN0aW9uIG9mIExhdW5jaCBDb25maWdzIHB1c2ggbXExClNUQVJUVElNRT0kKGRhdGUgKyVzJU4gfCBjdXQgLWIxLTEzKQpzdWRvIC9iaW4vYmFzaCAvb3B0L3NjcmlwdHMvZGVwbG95LnNoIG1xMQpzdWRvIC9iaW4vYmFzaCAvZXRjL2luaXQuZC9wdXNoIHN0YXJ0"
  key_name                           = "mykey"
  iam_instance_profile               = "myprofile"
  tags                               = local.tags
  launch_template_tag_specifications = local.tags
}

output "name" {
  description = "Amazon Resource Name (ARN) of the launch template."
  value       = aws_launch_template.main.name
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the launch template."
  value       = aws_launch_template.main.arn
}

output "id" {
  description = "The ID of the launch template."
  value       = aws_launch_template.main.id
}

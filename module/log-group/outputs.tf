output "arn" {
  value       = join("", aws_cloudwatch_log_group.default.*.arn)
  description = "ARN of the log group"
}

output "stream_arns" {
  value       = [aws_cloudwatch_log_stream.default.*.arn]
  description = "ARN of the log stream"
}


output "group_label_id" {
  value = module.label-cloudwatch-log-group.id
  description = "ID of the resource"
}

output "policy_label_id" {
  value = module.label-cloudwatch-log-policy.id
  description = "ID of the resource"
}
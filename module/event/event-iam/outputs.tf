output "arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.arn, [""]), 0)
}

output "id" {
  description = "The name of the rule."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.id, [""]), 0)
}

output "name" {
  description = "The rule's name."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.name, [""]), 0)
}

# output "name_prefix" {
#   description = "The rule's name. Conflicts with name."
#   value       = element(concat(aws_cloudwatch_event_rule.main.*.name_prefix, [""]), 0)
# }

output "schedule_expression" {
  description = "The scheduling expression."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.schedule_expression, [""]), 0)
}

output "event_pattern" {
  description = "Event pattern described a JSON object."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.event_pattern, [""]), 0)
}

output "description" {
  description = "The description of the rule."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.description, [""]), 0)
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.role_arn, [""]), 0)
}

output "is_enabled" {
  description = "Whether the rule should be enabled."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.is_enabled, [""]), 0)
}

output "tags" {
  description = "A mapping of tags to assign to the resource."
  value       = element(concat(aws_cloudwatch_event_rule.main.*.tags, [""]), 0)
}

##################################################################################################################
# output      : iam role outputs
# Description : Terraform output for iam role to allow other terraform projects to use these outputs
output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.iam_assumable_role_custom.this_iam_role_arn
}

output "iam_role_name" {
  description = "Name of IAM role"
  value       = module.iam_assumable_role_custom.this_iam_role_name
}

output "iam_role_path" {
  description = "Path of IAM role"
  value       = module.iam_assumable_role_custom.this_iam_role_path
}


##################################################################################################################
# output      : iam policy outputs
# Description : Terraform output for iam policy to allow other terraform projects to use these outputs
output "iam_policy_id" {
  description = "The policy ID"
  value       = module.iam_policy.id
}

output "iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.iam_policy.arn
}

output "iam_policy" {
  description = "The policy document"
  value       = module.iam_policy.policy
}
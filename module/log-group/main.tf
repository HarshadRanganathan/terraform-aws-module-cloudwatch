module "label-cloudwatch-log-group" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label.git//module?ref=1.0.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = compact(concat(var.attributes, list("log"), list("group")))
  tags       = var.tags
  enabled    = var.enabled
}

module "label-cloudwatch-log-policy" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label.git//module?ref=1.0.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = compact(concat(var.attributes, list("log"), list("policy")))
  tags       = var.tags
  enabled    = var.enabled
}

resource "aws_cloudwatch_log_group" "default" {
  count             = var.enabled ? 1 : 0
  name              = module.label-cloudwatch-log-group.id
  retention_in_days = var.retention_in_days
  tags              = module.label-cloudwatch-log-group.tags
  kms_key_id        = var.kms_key_arn

  #depends_on = [aws_cloudwatch_log_resource_policy.default]
}

resource "aws_cloudwatch_log_stream" "default" {
  count          = var.enabled && length(var.stream_names) > 0 ? length(var.stream_names) : 0
  name           = element(var.stream_names, count.index)
  log_group_name = element(aws_cloudwatch_log_group.default.*.name, 0)

  #depends_on = [aws_cloudwatch_log_group.default]
}

resource "aws_cloudwatch_log_resource_policy" "default" {
  count           = var.enabled && var.additional_policy ? 1 : 0
  policy_name     = module.label-cloudwatch-log-policy.id

  policy_document = data.aws_iam_policy_document.iam-policy[0].json
}

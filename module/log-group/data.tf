data "aws_iam_policy_document" "iam-policy" {
  count           = var.enabled && var.additional_policy ? 1 : 0
  statement {

    sid = "AllowLogs"

    actions = var.policy_resource_actions

    resources = var.policy_resource_arns

    principals {
      identifiers = [var.principals_identifiers]
      type        = "Service"
    }
  }
}
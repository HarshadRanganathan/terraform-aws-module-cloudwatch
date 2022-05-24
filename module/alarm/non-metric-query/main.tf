module "labels" {
  source = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label.git//module?ref=1.0.0"

  namespace  = var.label_namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = compact(concat(var.attributes, list("alarm")))
  tags       = var.tags
  enabled    = var.enabled
}

#Module      : CLOUDWATCH METRIC ALARM
#Description : Terraform module creates Cloudwatch Alarm on AWS for monitoriing AWS services.
resource "aws_cloudwatch_metric_alarm" "default" {
  count = var.enabled == true ? 1 : 0

  alarm_name                = module.labels.id
  alarm_description         = var.alarm_description
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  unit                      = var.unit
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_actions             = var.alarm_actions
  actions_enabled           = var.actions_enabled
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions                = var.ok_actions
  treat_missing_data        = var.treat_missing_data
  tags                      = module.labels.tags

  dimensions = var.dimensions

  depends_on = [module.labels]
}

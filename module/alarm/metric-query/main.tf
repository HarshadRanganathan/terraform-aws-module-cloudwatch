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

  alarm_name          = module.labels.id
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods

  dynamic "metric_query" {
    for_each = var.metric_query
    content {
      id          = lookup(metric_query.value, "id")
      label       = lookup(metric_query.value, "label", null)
      return_data = lookup(metric_query.value, "return_data", null)
      expression  = lookup(metric_query.value, "expression", null)
    }
    dynamic "metric" {
      for_each = lookup(metric_query.value, "metric", [])
      content {
        metric_name = lookup(metric.value, "metric_name")
        namespace   = lookup(metric.value, "namespace")
        period      = lookup(metric.value, "period")
        stat        = lookup(metric.value, "stat")
        unit        = lookup(metric.value, "unit", null)
        dimensions  = lookup(metric.value, "dimensions", null)
      }
    }
  }
  threshold_metric_id       = var.threshold_metric_id
  alarm_actions             = var.alarm_actions
  actions_enabled           = var.actions_enabled
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions                = var.ok_actions
  treat_missing_data        = var.treat_missing_data
  tags                      = module.labels.tags



  depends_on = [module.labels]
}

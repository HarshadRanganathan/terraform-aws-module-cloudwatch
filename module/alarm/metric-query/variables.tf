#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  default     = ""
  type        = string
  description = "Name  (e.g. `bastion` or `db`)"
}

variable "label_namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = string
  default     = ""
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
  default     = ""
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}


#Module      : CLOUDWATCH METRIC ALARM
#Description : Provides a CloudWatch Metric Alarm resource.
variable "enabled" {
  type        = bool
  default     = true
  description = "Enable alarm."
}

variable "alarm_description" {
  type        = string
  default     = ""
  description = "The description for the alarm."
}

variable "comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
  default     = null
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = null
}

variable "metric_name" {
  type        = string
  default     = "CPUUtilization"
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  type        = string
  default     = "AWS/EC2"
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  type        = number
  default     = 120
  description = "The period in seconds over which the specified statistic is applied."
}

variable "statistic" {
  type        = string
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric."
}

variable "threshold" {
  type        = number
  default     = 40
  description = "The value against which the specified statistic is compared."
}

variable "alarm_actions" {
  type        = list
  default     = []
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state."
}

variable "actions_enabled" {
  type        = bool
  default     = true
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
}

variable "insufficient_data_actions" {
  type        = list
  default     = []
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state."
}

variable "ok_actions" {
  type        = list
  default     = []
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state."
}

variable "instance_id" {
  type        = string
  default     = ""
  description = "The instance ID."
}

variable "dimensions" {
  type        = map(string)
  description = "the demisssions"
  default     = {}
}

variable "metric_query" {
  type        = map(string)
  default     = {}
  description = "(Optional) Enables you to create an alarm based on a metric math expression. You may specify at most 20"
}

variable "threshold_metric_id" {
  type        = string
  default     = ""
  description = "(Optional) If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function. "
}

variable "treat_missing_data" {
  type        = string
  description = "(Optional) Sets how this alarm is to handle missing data points."
  default     = "missing"
}
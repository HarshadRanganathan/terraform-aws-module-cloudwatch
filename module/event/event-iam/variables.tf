##################################################################################################################
# Module      : null label
# Description : Terraform variable for null lable
variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

##################################################################################################################
# Module      : Cloudwatch Event Rule
# Description : Terraform variable for cloudwatch event rul3
variable "description" {
  description = "(Optional) The description of the rule."
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "(Required, if event_pattern isn't specified) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes)."
  default     = null
  type        = string
}

variable "event_pattern" {
  description = "(Required, if schedule_expression isn't specified) Event pattern described a JSON object. See full documentation of CloudWatch Events and Event Patterns for details."
  default     = null
  type        = string
}

### Optional Variables
variable "role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  default     = null
  type        = string
}

variable "rule_tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  default     = {}
  type        = map
}

variable "is_enabled" {
  description = "(Optional) Whether the rule should be enabled (defaults to true)."
  default     = null
  type        = bool
}

##################################################################################################################
# Module      : Cloudwatch Event target
# Description : Terraform variable for cloudwatch event target
variable "target_id" {
  description = "(Optional) The unique target assignment ID. If missing, will generate a random, unique id."
  default     = null
  type        = string
}

variable "target_arn" {
  description = "(Required) The Amazon Resource Name (ARN) associated of the target."
  default     = null
  type        = string
}

variable "input" {
  description = "(Optional) Valid JSON text passed to the target."
  default     = null
  type        = string
}

variable "input_path" {
  description = "(Optional) The value of the JSONPath that is used for extracting part of the matched event when passing it to the target."
  default     = null
  type        = string
}

variable "target_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if ecs_target is used."
  default     = null
  type        = string
}

variable "run_command_targets" {
  description = "(Optional) A list of map describin parameters used when you are using the rule to invoke Amazon EC2 Run Command. Documented below. A maximum of 5 are allowed."
  default     = []
  type        = list(map(string))
}

variable "ecs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon ECS Task. Documented below. A maximum of 1 are allowed."
  default     = null
  type        = map
}

variable "batch_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Batch Job. Documented below. A maximum of 1 are allowed."
  default     = null
  type        = map
}

variable "kinesis_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. Documented below. A maximum of 1 are allowed."
  default     = null
  type        = map
}

variable "sqs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon SQS Queue. Documented below. A maximum of 1 are allowed."
  default     = null
  type        = map
}

variable "input_transformer" {
  description = "(Optional) Parameters used when you are providing a custom input to a target based on certain event data."
  default     = []
}

### Avoid resources creation
variable "enabled" {
  description = "Whether resources have to be deployed"
  default     = true
}

variable "target_enabled" {
  description = "Whether resources have to be deployed"
  default     = true
}

##################################################################################################################
# variable      : iam role
# Description : Terraform variable for iam role
variable "create_role" {
  description = "Whether to create glue_svc role"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "IAM role with glue_svc access"
  type        = string
  default     = "AWS_840891909344_glue_svc"
}

variable "role_path" {
  description = "Path of glue_svc IAM role"
  type        = string
  default     = "/"
}

variable "role_policy_arns" {
  description = "List of policy ARNs to use for glue_svc role"
  type        = list(string)
  default     = [""]
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for glue_svc role"
  type        = string
  default     = ""
}

variable "role_tags" {
  description = "A map of tags to add to glue_svc role resource."
  type        = map(string)
  default     = {}
}

variable "role_description" {
  description = "Add a decription to the role"
  type        = string
  default     = "Managed by Terraform"
}

variable "role_requires_mfa" {
  description = "if the role requires mfa"
  type        = bool
  default     = false
}

variable "trusted_role" {
  description = "The trust relationship/s the role has, example states.amazonaws.com, ec2.amazonaws.com, or lambda.amazonaws.com"
  type        = string
  default     = ""
}

##################################################################################################################
# variable      : iam policy
# Description : Terraform variable for iam policy
variable "policy_path" {
  description = "The path of the in IAM"
  type        = string
  default     = "/"
}

variable "policy_name" {
  description = "The path of the in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "policy" {
  description = "The path of the in IAM (tpl file)"
  type        = string
  default     = ""
}

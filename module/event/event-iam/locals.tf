locals {
  rule_tags = merge(
          var.tags, var.rule_tags,
  {
    Name = module.default_label.id
  }
  )
}
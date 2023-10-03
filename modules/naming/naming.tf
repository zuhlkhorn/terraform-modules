locals {
  exclude_from_default = [
    "azurerm_log_analytics_solution",
    "azurerm_monitor_data_collection_rule",
    "azurerm_monitor_data_collection_rule_association",
    "azurerm_monitor_data_collection_endpoint",
    "azurerm_management_lock"
  ]
}

resource "azurecaf_name" "default" {
  for_each = {
    for k, v in toset(var.resources) : k => v
    if ! contains(local.exclude_from_default, k)
  }

  name           = "basename"
  random_length  = var.name_random_part_length
  resource_type = each.key
}

resource "azurecaf_name" "short" {
  for_each = toset(var.resources_with_short_names)

  name           = "shortname"
  random_length  = 0
  resource_type = each.key
}

resource "azurecaf_name" "short-alphanumeric" {
  for_each = toset(var.resources_with_alphanumeric_names)

  name           = "alphanumeric"
  random_length  = 0
  resource_type = each.key
}

locals {
  temp_names = merge(
    { for key, value in azurecaf_name.default : key => value.result },
    contains(var.resources, "azurerm_log_analytics_solution") ? { "azurerm_log_analytics_solution" = "las-basename" } : {},
    contains(var.resources, "azurerm_monitor_data_collection_rule") ? { "azurerm_monitor_data_collection_rule" = "dcr-basename" } : {},
    contains(var.resources, "azurerm_monitor_data_collection_rule_association") ? { "azurerm_monitor_data_collection_rule_association" = "dcra-basename" } : {},
    contains(var.resources, "azurerm_monitor_data_collection_endpoint") ? { "azurerm_monitor_data_collection_endpoint" = "dcre-basename" } : {},
    contains(var.resources, "azurerm_management_lock") ? { "azurerm_management_lock" = "lock-basename" } : {},
  )
  temp_short_names = { for key, value in azurecaf_name.short : key => value.result }
  temp_short_alphanumeric = { for key, value in azurecaf_name.short-alphanumeric : key => value.result }
}

locals {
  names = merge(
    { for key, value in local.temp_names : key => "${var.prefix}-${replace(value, "basename", "%s-${var.namespace}-${var.environment}-szn")}" },
    { for key, value in local.temp_short_names : key => "${var.prefix}-${replace(value, "shortname", "%s-${var.namespace}-${var.environment}")}" },
    { for key, value in local.temp_short_alphanumeric : key => "${var.prefix}${replace(value, "alphanumeric", "%s${var.namespace}${var.environment}")}" }
  )
}
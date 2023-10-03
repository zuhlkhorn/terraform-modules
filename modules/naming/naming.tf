resource "azurecaf_name" "default" {
  for_each = toset(var.resources)

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
    { "azurerm_log_analytics_solution" = "las-basename" },
    { "azurerm_monitor_data_collection_rule" = "dcr-basename" },
    { "azurerm_monitor_data_collection_rule_association" = "dcra-basename" },
    { "azurerm_monitor_data_collection_endpoint" = "dcre-basename" },
    { "azurerm_management_lock" = "lock-basename" }
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
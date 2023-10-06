# terraform-modules

⚠️ **This repository is public. Do NOT store any client specific data.** ⚠️

This is a collection of various generic re-usable Terraform modules. Only put **generic** modules here, that are not specific to a certain Subscription and that might be re-used in multiple subscriptions.

Rule #1: **If you don't need it in two Terraform Repositories, do NOT place it here!**

Rule #2: **Only place it here when you need to use it in more than one Terraform Repository!**

## naming module

The naming module is a generic module that can be used to create consistent naming convention for resources based on the adopted convention.

`main.tf`
```hcl
module "naming" {
  source = "git::https://github.com/zuhlkhorn/terraform-modules.git//modules/naming"
  prefix = var.prefix             # mandatory: prefix for all resources
  environment = var.environment   # mandatory: environment (dev, test, prod)
  namespace = var.namespace       # mandatory: namespace (application name)
  name_random_part_length = 0     # optional: length of random part of name (default: 0)
  resources = [                   # optional: resource type names; recommended only to select used ones to reduce deployment time.
    "azurerm_virtual_machine",
    "azurerm_linux_virtual_machine"
  ] 
  resources_with_short_names = [  # optional: resource type names
    "azurerm_key_vault"
  ] 
  resources_with_alphanumeric_names = [ # optional: resource type names
    "azurerm_storage_account"
  ] 
}
```

`*.tf` to create a resource
```hcl
resource "azurerm_resource_group" "app" {
  location = var.region
  name     = format(module.naming.placeholders["azurerm_resource_group"], "app")
  # where `app` is the resource name
}
```

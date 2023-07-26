variable "default_name_length" {
  default = 0
}

variable "namespace" {
  type        = string
  validation {
    condition     = length(var.namespace) > 0
    error_message = "You must specify a namespace."
  }
  description = "The name of the application or project"
}

variable "environment" {
  type = string
  validation {
    condition     = length(var.environment) > 0
    error_message = "You must specify an environment."
  }
}

variable "prefix" {
  type        = string
  validation {
    condition     = length(var.prefix) > 0
    error_message = "You must specify a prefix."
  }
  description = "A short prefix for all resources"
}
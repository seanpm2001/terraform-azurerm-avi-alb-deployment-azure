# Copyright 2022 VMware, Inc.
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.14.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.26.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.2"
    }
  }
}
resource "azurerm_resource_group" "avi" {
  count    = var.create_resource_group ? 1 : 0
  name     = "rg-${var.name_prefix}-avi-${local.region}"
  location = var.region
}

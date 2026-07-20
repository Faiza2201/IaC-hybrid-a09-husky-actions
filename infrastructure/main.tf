# infrastructure/main.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

                                       resource "azurerm_resource_group" "rg" {
  name     = "lab9Husky-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storageterraformname" {
  name                     = "strlab9husky001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
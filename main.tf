terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  cloud {
    organization = "adds"

    workspaces {
      name = "remotestate"
    }
  }
}

provider "azurerm" {
  subscription_id = "b0418ef8-5ce8-4715-af49-5c86a0afd754"
  tenant_id       = "b7fd422c-1ba5-44ca-af6c-e0c3cbdad840"
  client_id       = "de6538a4-c89a-40b6-a1bf-5ba986389773"
  client_secret   = "yzB8Q~kk4kfHjsJAtYI2W13l6SUQr_rub9x2VbJG"
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "RG-Git"
  location = "Central US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "addsstorage12390"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}
resource "azurerm_storage_account" "storage" {
  name                     = "prdaddsstorage12390"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}

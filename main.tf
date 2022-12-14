terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name      = "terraform"
    storage_account_name     = "terraformstateadrianpa"
    container_name           = "terraform"
    key                      = "terraform.tfstate"
  }
  required_version = ">= 1.3.3"
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription
  tenant_id       = var.tenant
  client_id       = var.appId
  client_secret   = var.secret
}
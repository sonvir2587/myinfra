terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rgmaster"
  #   storage_account_name = "stgmaster"
  #   container_name       = "tfstate"
  #   key                  = "prod.tfstate"

  # }
}

provider "azurerm" {
  features {}
  subscription_id = "e5476362-58a0-48f7-8197-5aa05a4abfa5"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "aksrg"
    storage_account_name = "fileshare112233"
    container_name       = "tfstate"
    key                  = "prod.tfstate"

  }
}

provider "azurerm" {
  features {}
  
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
  subscription_id     = "d7fae670-2697-4793-a5a3-b0961a825a1c"
  storage_use_azuread = true
}

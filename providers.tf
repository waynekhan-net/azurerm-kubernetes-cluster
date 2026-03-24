provider "azurerm" {
  resource_provider_registrations = "none" # As our access is limited

  features {}

  subscription_id = local.subscription_id
}

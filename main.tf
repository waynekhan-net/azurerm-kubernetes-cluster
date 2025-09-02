locals {
  cluster_name       = "sup-wkhan-dev"
  cluster_dns_prefix = "supwkhandevdns"

  # Default pool
  node_pool_name = "agentpool"
  node_count     = 1
  node_vm_size   = "Standard_D4ds_v5"

  identity_type = "SystemAssigned"

  resource_group_name = "rg-services-01"
  subscription_id     = "1d7d141b-b12f-474e-8ef5-231f9a6e8367"

  tags = {
    Owner = "Wayne Khan"
    Team  = "Support"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.38.1"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none" # As our access is limited

  features {}

  subscription_id = local.subscription_id
}

data "azurerm_resource_group" "services" {
  name = local.resource_group_name
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = local.cluster_name
  location            = "switzerlandnorth"
  resource_group_name = data.azurerm_resource_group.services.name
  dns_prefix          = local.cluster_dns_prefix

  default_node_pool {
    name       = local.node_pool_name
    node_count = local.node_count
    vm_size    = local.node_vm_size
  }

  identity {
    type = local.identity_type
  }

  tags = local.tags
}


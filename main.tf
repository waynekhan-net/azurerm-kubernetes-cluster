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


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



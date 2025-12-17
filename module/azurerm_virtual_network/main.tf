resource "azurerm_virtual_network" "vnetwork" {
  for_each            = var.virtual_network
  name                = each.value.vnet-name
  location            = each.value.location
  resource_group_name = each.value.rg-name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }


  tags = {
    environment = "Production"
    ManagedBy   = "Terraform"
  }
}


# data "azurerm_key_vault" "kv{
#   for_each = var.virtual_machine
#   name                = each.value.kv-name
#   resource_group_name = "some-resource-group"
# }

# data "azurerm_key_vault_secret" "example" {
#   for_each = var.virtual_machine
#   name         = "secret-sauce"
#   key_vault_id = data.azurerm_key_vault.existing.id
# }

# data "azurerm_key_vault_secret" "example" {
#   for_each = var.virtual_machine
#   name         = "secret-sauce"
#   key_vault_id = data.azurerm_key_vault.existing.id
# }


data"azurerm_subnet" "subnet" {
for_each            = var.virtual_machine
name = each.value.subnet-name
virtual_network_name = each.value.vnet-name
resource_group_name = each.value.rg-name
}
resource "azurerm_network_interface" "nic" {
  for_each            = var.virtual_machine
  name                = each.value.nic-name
  location            = each.value.location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vms" {
  for_each              = var.virtual_machine
  name                  = each.value.vm-name
  location              = each.value.location
  resource_group_name   = each.value.rg-name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  size               = each.value.vm_size
  disable_password_authentication = false
  admin_username = "masteradmin"
  admin_password = "P@ssword112233"
 
  os_disk {
    name              = each.value.os_disk.name
    caching           = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  tags = {
    environment = each.value.tags.environment
    project = each.value.tags.project
    managed_by   = each.value.tags.managed_by
  }
}

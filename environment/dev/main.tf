module "resource_group" {
  source         = "../../module/azurerm_resource_group"
  resource_group = var.devinfra
}


module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../module/azurerm_storage_account"
  storage_account = var.devinfra
}


module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../module/azurerm_virtual_network"
  virtual_network = var.devinfra
}

module "virtual_machine" {
  depends_on      = [module.virtual_network]
  source          = "../../module/azurerm_virtual_machine"
  virtual_machine = var.devinfra
}

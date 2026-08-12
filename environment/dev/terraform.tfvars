devinfra = {
  inputs = {
    rg-name    = "dev-master"
    location   = "eastus"
    managed_by = "terraform"
    tags = {
      environment = "dev"
      project     = "myacademy"
      managed_by   = "terraform"
    }
    stg-name                 = "devmasterstg1"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    vnet-name                = "dev_network"
    address_space            = ["10.0.0.0/32"]
    dns_servers              = ["10.0.0.4", "10.0.0.5"]
    subnets = {
      subnet1 = {
        name             = "dev_frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        name             = "dev_backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  
    nic-name    = "dev_frontend_nic"
    subnet-name = "dev_frontend_subnet"
    vm-name     = "devfrontendvm"
    vm_size     = "Standard_D2ads_v7"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-22_04-lts"
      sku       = "server"
      version   = "latest"
    }

    os_disk = {
      name                 = "devfrontend_os_disk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    tags = {
      environment = "dev"
      project     = "myacademy"
      managed_by   = "terraform"
    }
  }

  # vm2 = {
  #   nic-name    = "dev_backend_nic"
  #   subnet-name = "dev_backend_subnet"
  #   vm-name     = "devbackendvm"
  #   vm_size     = "Standard_F2"

  #   source_image_reference = {
  #     publisher = "Canonical"
  #     offer     = "0001-com-ubuntu-server-jammy"
  #     sku       = "22.04-LTS"
  #     version   = "latest"
  #   }

  #   os_disk = {
  #     name                 = "dev_os_disk"
  #     caching              = "ReadWrite"
  #     storage_account_type = "Standard_LRS"
  #   }

  #   tags = {
  #     environment = "dev"
  #     project     = "myacademy"
  #     managed_by  = "terraform"
  #   }
  # }

}
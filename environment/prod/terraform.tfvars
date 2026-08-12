rgs = {
  rg1 = {
    rg-name    = "prod-master"
    location   = "eastus"
    managed_by = "terraform"
    tags = {
      environment = "prod"
      project     = "myacademy"
    }
  }

  # rg2 = {
  #   name     = "master2"
  #   location = "westus"
  #   tags = {
  #     enviroment = "dev"
  #     project = "terraform"
  #   }
  # }
  # rg3 = {
  #   name     = "master3"
  #   location = "centralus"
  #   tags = {
  #     enviroment = "dev"
  #     project = "terraform"
  #   }
  # }
}

stgs = {
  stg1 = {
    stg-name                 = "prodmasterstg1"
    location                 = "eastus"
    rg-name                  = "prod-master"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  # stg2 = {
  #   name                     = "masterstg2"
  #   location                 = "westus"
  #   rgname                   = "master2"
  #   account_tier             = "Standard"
  #   account_replication_type = "GRS"
  # }
  # stg3 = {
  #   name                     = "masterstg3"
  #   location                 = "centralus"
  #   rgname                   = "master3"
  #   account_tier             = "Standard"
  #   account_replication_type = "GRS"
  # }
}

vnets = {
  vnet1 = {
    vnet-name     = "prod_network"
    location      = "eastus"
    rg-name       = "prod-master"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4", "10.0.0.5"]

    subnets = {
      subnet1 = {
        name             = "prod_frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        name             = "prod_backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
    tags = {
      environment = "Production"
      project     = "myacademy"
      managed_by  = "terraform"
    }
  }
}

vms = {
  vm1 = {
    nic-name    = "prod_frontend_nic"
    vnet-name   = "prod_network"
    subnet-name = "prod_frontend_subnet"
    vm-name     = "prodfrontendvm"
    location    = "eastus"
    rg-name     = "prod-master"
    vm_size     = "Standard_D2ads_v7"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-22_04-lts"
      sku       = "server"
      version   = "latest"
    }

    os_disk = {
      name                 = "prodfrontend_os_disk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    tags = {
      environment = "Production"
      project     = "myacademy"
      managed_by  = "terraform"
    }
  }

  vm2 = {
    nic-name    = "prod_backend_nic"
    vnet-name   = "prod_network"
    subnet-name = "prod_backend_subnet"
    vm-name     = "prodbackendvm"
    location    = "eastus"
    rg-name     = "prod-master"
    vm_size     = "Standard_D2ads_v7"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-22_04-lts"
      sku       = "server"
      version   = "latest"
    }

    os_disk = {
      name                 = "prodbackend_os_disk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    tags = {
      environment = "Production"
      project     = "myacademy"
      managed_by  = "terraform"
    }
  }

}

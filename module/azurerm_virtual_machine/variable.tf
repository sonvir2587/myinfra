variable "virtual_machine" {
  type = map(object({
    vm-name               = string
    location              = string
    rg-name               = string
    nic-name              = string
    vnet-name             = string
    subnet-name           = string
    vm_size               = string
    os_disk = object({
      caching              = string
      storage_account_type = string
      name                 = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    tags = object({
      environment = string
      project = string
      managed_by   = string
    })
  }))
}


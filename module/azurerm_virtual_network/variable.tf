variable "virtual_network" {
  type = map(object({
    vnet-name     = string
    location      = string
    rg-name       = string
    address_space = list(string)
    dns_servers   = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

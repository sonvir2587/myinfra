variable "storage_account" {
  type = map(object({
    stg-name                     = string
    rg-name                   = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}


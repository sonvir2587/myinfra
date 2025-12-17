variable "resource_group" {
    type = map(object({
        rg-name = string
        location = string
        managed_by = optional(string)
        tags = map(string)
}))
}


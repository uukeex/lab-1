variable "server-name" {
  type        = string
  default     = "kot"
  description = "Name of a server to provision"
}

locals {
  minNumberOfServers = 1
  maxNumberOfServers = 10
}

locals {
  countOfItems = {
    disks   = 13
    servers = 22
    max     = local.maxNumberOfServers + var.number-of-disks
  }
}

variable "number-of-servers" {
  type        = number
  description = "Required number of servers"
  default     = 2
  validation {
    condition     = var.number-of-servers >= local.minNumberOfServers && var.number-of-servers < local.maxNumberOfServers
    error_message = "Not supported number of servers, it should be between [${local.minNumberOfServers}, ${local.maxNumberOfServers})"
  }
}

variable "number-of-disks" {
  type = number
}

variable "list-of-names" {
  type = list(string)
}

output "result" {
  value = "${var.server-name} x ${var.number-of-servers}"
}

output "number-of-resources" {
  value = var.number-of-disks + var.number-of-servers
}

output "list-of-names" {
  value = join(",", var.list-of-names)
}

output "key-from-map" {
  value = lookup(local.countOfItems, "max")
}
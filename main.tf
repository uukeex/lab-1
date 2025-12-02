variable "server-name" {
  type        = string
  description = "Name of a server to provision"
}

locals {
  minNumberOfServers = 1
  maxNumberOfServers = 10
}
variable "number-of-servers" {
  type = number
  description = "Required number of servers"
  validation {
    condition = var.number-of-servers >= local.minNumberOfServers && var.number-of-servers < local.maxNumberOfServers
    error_message = "Not supported number of servers, it should be between [${local.minNumberOfServers}, ${local.maxNumberOfServers})"
  }
}

output "out" {
  value = var.server-name
}
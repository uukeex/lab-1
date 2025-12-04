# Write a calculator

variable "a" {
  type = number
}

variable "z" {
  type = number
}

# Allowed: +, -, *, /
variable "operand" {
  type = string
   validation {
    condition     = contains(["+", "-", "*", "/"], var.operand)
    error_message = "Invalid operator"
  }
}

locals {
  mapa_kalkulator = {
    "+" = var.a + var.z
    "-" = var.a - var.z
    "*" = var.a * var.z
    "/" = var.a / var.z
  }
}

output "result" {
  value = lookup(local.mapa_kalkulator, var.operand)
}
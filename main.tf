variable "a" {
  type = number
}

variable "z" {
  type = number

  validation {
    condition     = !(var.operand == "/" && var.z == 0)
    error_message = "Division by zero is not allowed."
  }
}

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

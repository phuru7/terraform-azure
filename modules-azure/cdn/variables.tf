##variables
variable ambiente {}
variable cdn_name {}
variable location {}
variable cdn_resource_group {}
variable cdn_tier {}


##locals
locals {
  tags = {
    proyecto  = "prima"
    ambiente  = var.ambiente == "d" ? "DESARROLLO" : var.ambiente == "c" ? "CERTIFICACION" : "PRODUCCION"
  }
}

##Contexto
data "azurerm_subscription" "current" {}

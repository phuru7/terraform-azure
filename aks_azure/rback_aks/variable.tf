variable aksv_name {}
variable aksv_rg_name {}
variable ad_group_name {}

data "azurerm_kubernetes_cluster" "aksv" {
  name                = var.aksv_name
  resource_group_name = var.aksv_rg_name
}

data "azuread_group" "binding_cert"{
	name = var.ad_group_name
}
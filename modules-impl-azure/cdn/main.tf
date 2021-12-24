provider azurerm {
  features {}
  version = "2.17.0"
}
#CDN

resource "azurerm_cdn_profile" "cdn" {
  name                = var.cdn_name
  resource_group_name = var.cdn_resource_group
  location            = var.location
  sku                 = var.cdn_tier
  tags                = local.tags
}

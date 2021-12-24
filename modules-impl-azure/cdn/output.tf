
output "subscription" {
  value = "${data.azurerm_subscription.current.display_name}/${data.azurerm_subscription.current.subscription_id}"
}
output "cnd_name" {
  value = azurerm_cdn_profile.cdn.name
}
output "resourceGroup" {
  value = azurerm_cdn_profile.cdn.resource_group_name
}
output "flavor" {
  value = azurerm_cdn_profile.cdn.sku
}
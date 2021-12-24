provider "azurerm" {
  version = "=2.17.0"
  features {}
}

resource "azurerm_storage_account" "stac" {

  name                     = var.stac_name
  resource_group_name      = var.stac_rg_name
  location                 = var.stac_location
  account_tier             = var.stac_tier
  account_replication_type = var.stac_replication
  access_tier              = var.stac_access_tier
  tags                     = local.tags

}


resource "azurerm_storage_container" "stac" {
 	for_each = {for container in var.container:
							container.name => { access =  container.access_type 
																	stac_name = azurerm_storage_account.stac.name } 
	}
  name                  = each.key 
  storage_account_name  = each.value.access 
  container_access_type = each.value.stac_name 

}


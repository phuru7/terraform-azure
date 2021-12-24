provider "azurerm"{
  version = "2.17.0"
  features {}
}

resource "azurerm_resource_group" "rsgr"{


  name      = var.rg_name  
  location  = var.rg_location 

  tags = local.tags
}

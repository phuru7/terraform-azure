provider azurerm{
version = "2.17.0"
features {}
}

provider random{
  version = "2.3.0"
}

resource "random_password" "password"{
  length           = 16
  special          = true
  override_special = "_%@"
}
  
resource "azurerm_sql_server" "sql" {
  name                         = var.azse_name 
  resource_group_name          = var.azse_rg_name 
  location                     = var.azse_location 
  version                      = "12.0"
  administrator_login          = "adminprima"
  administrator_login_password = random_password.password.result 

  tags = local.tags 

}

/*resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = "sql-vnet-rule"
  resource_group_name = var.azse_rg_name 
  server_name         = azurerm_sql_server.sql.name
  subnet_id           = var.subnet_id
}
*/
resource "azurerm_sql_database" "db"{
  name                = var.azdb_name 
  location            = var.azse_location 
  resource_group_name = var.azse_rg_name 
  server_name         = azurerm_sql_server.sql.name
  edition             = var.sql_db_size_type
  requested_service_objective_name = var.sql_db_size

}

/*
resource "azurerm_sql_active_directory_administrator" "msql_ad" {
  server_name         = azurerm_sql_server.sql.name
  resource_group_name = azurerm_sql_server.sql.resource_group_name
  login               = local.msql_ad_administrator_login
  object_id           = local.msql_ad_administrator_object_id
  tenant_id           = local.msql_tenant_id
}

*/

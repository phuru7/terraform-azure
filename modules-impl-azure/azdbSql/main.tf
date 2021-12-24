resource "azurerm_sql_database" "db"{
  name                = var.azdb_name 
  location            = var.azse_location 
  resource_group_name = var.azse_rg_name 
  server_name         = var.azse_name
  edition             = var.sql_db_size_type
  max_size_bytes	  = 107374182400
  requested_service_objective_name = var.sql_db_size

}

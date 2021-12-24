provider azurerm  {
      version = "2.17.0" 
      features {}
    }

#Resource Group

module "rsgr_prima" {
source = "./resourceGroup"
rg_name = "rg-EstadoAhorros-Desa"
rg_location = "eastus2"
ambiente = "d"
}


#Storage Account 
module "stac"{
  source        = "./stac"
  stac_name     = "stestadoahorrosdesa" 
  stac_rg_name  =  module.rsgr_prima.name 
  stac_location = "eastus2"
  stac_replication = "lrs"
  stac_tier = "Standard"
  stac_access_tier = "Hot"
  ambiente = "d"
  container = []
}


module "cdn" {
    source = "./cdn"
    ambiente = "d"
    cdn_name = "cdnEstadoAhorros-Desa"
    location = "eastus2"
    cdn_resource_group =  module.rsgr_prima.name
    cdn_tier ="Premium_Verizon"
}

#Database
module "azsql"{
 source = "./azdbSql"
 azse_name =  "sqlsrvdatalayerdesa"
 azdb_name = "bd-EstadoAhorros-Desa"
 azse_rg_name = "rg-DataLayer-Desa" 
 azse_location = "eastus2"
 sql_db_size = "GP_GEN5_2"
 sql_db_size_type = "GeneralPurpose"
 ambiente = "d"
}





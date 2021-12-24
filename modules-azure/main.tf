provider azurerm  {
      version = "2.17.0" 
      features {}
    }


#Storage Account 
module "stac_diag"{
  source        = "./stac"
  stac_name     = "stadiag01prod" 
  stac_rg_name  = module.rsgr_prima.name 
  stac_location = "eastus2"
  stac_replication = "lrs"
  stac_tier = "Standard"
  stac_access_tier = "Hot"
  ambiente = "p"
  container = []
  
}
module "stac_front"{
  source        = "./stac"
  stac_name     = "stfrontlayerprod" 
  stac_rg_name  = module.rsgr_FrontLayer.name  
  stac_location = "eastus2"
  stac_replication = "lrs"
  stac_tier = "Standard"
  stac_access_tier = "Hot"
  ambiente = "p"
  container = []
  
}

#Database
module "azsql"{
 source = "./azdbSql"
 azse_name =	"sqlsrvdatalayerprod"
 azdb_name = "sqlbddatalayerprod"
 azse_rg_name = module.rsgr_DataLayer.name 
 azse_location = "eastus2"
 sql_db_size = "GP_GEN5_2"
 sql_db_size_type = "GeneralPurpose"
 ambiente = "p"
 #subnet_id = module.vnet_aplicacion.subnet_id["AplicacionDESA-DataLayer"]

}



provider azurerm  {
      version = "2.17.0" 
      features {}
    }


module "aks_rbac" {
  source = "./rback_aks"
  aksv_rg_name  = "rg-ServiceCanal-Prod" 
  aksv_name		= "aksServiceCanal-Prod"
  ad_group_name = "AKS_Prod_Sc_Reader"
}
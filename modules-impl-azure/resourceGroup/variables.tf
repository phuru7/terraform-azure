variable "rg_name"{
  type = string
}
variable "rg_location"{
  type = string
}
variable "ambiente"{
  type = string
}

locals {
map_cod_env = {
    c = "CERTIFICACION"
    d = "DESARROLLO"
    p= "PRODUCCION"
  }
tags= {
  project = "prima"  
  ambiente = local.map_cod_env[var.ambiente] 

  }
}

variable "stac_name"{
  type = string
}
variable "stac_rg_name"{
  type = string
}
variable "stac_location"{
  type = string
}
variable "stac_replication"{
  type = string
}
variable "stac_access_tier"{
  type = string
}
variable "stac_tier"{
  type = string
}
variable "ambiente"{
  type = string
}
variable "container"{
  type = list(object({ name = string,
                      access_type = string,
  }))
}

locals{
  
  map_cod_env = {
    p = "PRODUCCION"
    d = "DESARROLLO" 
    c = "CERTIFICACION"
  }
  tags = {
    projecto = "prima"
    ambiente = local.map_cod_env[var.ambiente]
  }
 
}



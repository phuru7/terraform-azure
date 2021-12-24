variable "azdb_name"{
 type = string
}
variable "azse_rg_name"{
 type = string
}

variable "azse_name"{
  type = string
}
variable "azse_location"{
  type = string
}
variable "ambiente"{
  type = string
}
variable "sql_db_size_type"{
  type = string
}
variable "sql_db_size"{
  type = string
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

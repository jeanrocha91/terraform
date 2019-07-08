variable "project_id" {
  type    = "string"
  default = "projeto-246119"
}

variable "regiao" {
  type = "string"
  default = "northamerica-northeast1"
}

variable "nome" {
  type = "string"
  default = "vm-webserver"
}

variable "tipo_maquina" {
  type = "string"
  default = "f1-micro"
}

variable "zona" {
  type = "string"
  default = "northamerica-northeast1-a"
}

variable "imagem" {
  type = "string"
  default = "debian-cloud/debian-9"
}

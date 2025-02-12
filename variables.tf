
variable "compartment_id" {
type        = string
description = "O ID do compartimento onde o Exadata VM Cluster será criado."
}

variable "tenancy_ocid" {
type        = string
description = "O ID do compartimento onde o Exadata VM Cluster será criado."
}

variable "grid_image_id" {
type        = string
description = "O ID do compartimento onde o Exadata VM Cluster será criado."
}
variable "exadb_vm_cluster_availability_domain" {
type        =  string
description = "O domínio de disponibilidade onde o Exadata VM Cluster será criado."
}
variable "exascale_db_storage_vault_id" {
  type        = string
  description = "O ID do cofre de armazenamento Exascale DB."
}
variable "exadb_vm_cluster_ssh_public_keys" {
type        = list(string)
description = "As chaves públicas SSH para acesso ao Exadata VM Cluster."
}

data "oci_identity_availability_domains" "test_availability_domains" {
  compartment_id = var.tenancy_ocid
}

locals {
  ad = data.oci_identity_availability_domains.test_availability_domains.availability_domains.0.name
}

resource "oci_database_database_software_image" "orcl_database_software_image" {
  # ID do Compartimento
  compartment_id = var.compartment_id  
  display_name   = "GIImage-202501282353"
}

data "oci_database_gi_versions" "test_gi_versions" {
  #Required
  compartment_id = var.compartment_id
  #Optional
  shape               = "ExaDbXS"
  availability_domain = local.ad
}

data "oci_database_gi_version_minor_versions" "test_gi_minor_versions" {
  #Required
  version = data.oci_database_gi_versions.test_gi_versions.gi_versions[0].version
  #Optional
  compartment_id                 = data.oci_database_gi_versions.test_gi_versions.compartment_id
  availability_domain            = data.oci_database_gi_versions.test_gi_versions.availability_domain
  shape_family                   = "EXADB_XS"
  shape                          = data.oci_database_gi_versions.test_gi_versions.shape
  is_gi_version_for_provisioning = false
}


resource "oci_database_exascale_db_storage_vault" "test_exascale_db_storage_vault" {
  #Required
  availability_domain = local.ad
  compartment_id      = var.compartment_id
  display_name        = "ExampleExascaleDbStorageVault"
  high_capacity_database_storage {
    total_size_in_gbs = 300
  }
  additional_flash_cache_in_percent = 34 
}

data "oci_database_exascale_db_storage_vaults" "test_exascale_db_storage_vaults" {
  #Required
  compartment_id = var.compartment_id
}

data "oci_database_exascale_db_storage_vault" "test_exascale_db_storage_vault" {
  #Required
  exascale_db_storage_vault_id = oci_database_exascale_db_storage_vault.test_exascale_db_storage_vault.id
}


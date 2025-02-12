// Copyright (c) 2017, 2024, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

resource "oci_database_exadb_vm_cluster" "test_exadb_vm_cluster" {
  #Required
  availability_domain          = var.exadb_vm_cluster_availability_domain 
  compartment_id               = var.compartment_id
  display_name                 = "ExampleExadbVmCluster"
  exascale_db_storage_vault_id = oci_database_exascale_db_storage_vault.test_exascale_db_storage_vault.id 
  grid_image_id                = data.oci_database_gi_version_minor_versions.test_gi_minor_versions.gi_minor_versions[0].grid_image_id 
  hostname                     = "apollo"
  cluster_name                 = "apollo"
  shape                        = "EXADBXS"
  ssh_public_keys              = var.exadb_vm_cluster_ssh_public_keys
  subnet_id                    = "ocid1.subnet.oc1.iad.aaaaaaaaiwcecpodrvq3acmhxywccnjb4d36idvcne4w76fqbpt2iaz7lska" 
  backup_subnet_id             = "ocid1.subnet.oc1.iad.aaaaaaaanqqafmc3u35icxc6oso6c7n6vjgjrhxngumzsjx4nhm6djxktm6q" 

  node_config {
    enabled_ecpu_count_per_node              = "8"
    total_ecpu_count_per_node                = "16"
    vm_file_system_storage_size_gbs_per_node = "293"
  }

  node_resource {
    node_name = "node1"
  }

  node_resource {
    node_name = "node2"
  }

}

data "oci_database_exadb_vm_clusters" "test_exadb_vm_clusters" {
  #Required
  compartment_id = var.compartment_id
  #Optional
  exascale_db_storage_vault_id = oci_database_exascale_db_storage_vault.test_exascale_db_storage_vault.id 
}

data "oci_database_exadb_vm_cluster" "test_exadb_vm_cluster" {
  #Required
  exadb_vm_cluster_id = oci_database_exadb_vm_cluster.test_exadb_vm_cluster.id
}


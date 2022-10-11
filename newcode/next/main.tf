# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "storage_dev" {
    source = "./modules/storage"
    name = module.storage.name
}

module "storage_dev1" {
    source = "./Azure_Synapse"
    storage_account = module.storage_dev.name
    account_tier = "Standard"
    account_replication_type = "LRS"
    account_kind = "BlobStorage" 
}

module "datalake_dev" {
    source = "./Azure_Synapse"
    storage_data_lake = "datalakedev"  
}

module "ws" {
    source = "./Azure_Synapse"
    synapse_workspace = "testingsynapse"
    identity = "systemidentity"
    settings = null
    node_size = "small"
}

module "firewall_dev" {
    source = "./Azure_Synapse"
    synapse_firewall_rule = "firewall_dev"
    start_ip_address = "0.0.0.0"
    end_ip_address = "255.255.255.255"

}

module "sparkpool" {
    source = "./Azure_Synapse"
    synapse_spark_pool = "sparkpool"
    node_size_family = "MemoryOptimized" 
}

module "private_end_point_dev" {
    source = "./Azure_Synapse"
    synapse_private_endpoint = "private-endpoint_dev"
    subresource_name = "blob" 
}
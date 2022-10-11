output "resourcegroup" {
    value = data.azurerm_resource_group.demo 
}

output "storageaccount" {
    value = module.storage_dev.storageaccount 
}

output "datalake" {
    value = module.datalake_dev.datalake
}

output "synapse_workspace" {
    value = module.ws.synapse_workspace
}

output "synapse_firewall_rule" {
    value = module.firewall_dev.synapse_firewall_rule  
}

output "synapse_spark_pool" {
    value = module.sparkpool.synapse_spark_pool  
}

output "synapse_managed_private_endpoint" {
    value = module.private_end_point_dev.synapse_managed_private_endpoint
}
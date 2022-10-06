output "resourcegroup" {
    value = data.azurerm_resource_group.demo 
}

output "storageaccount" {
    value = azurerm_storage_account.storage_dev.name  
}

output "datalake" {
    value = azurerm_storage_data_lake_gen2_filesystem.datalake_dev.name
}

output "synapse_workspace" {
    value = azurerm_synapse_workspace.ws.name
}

output "synapse_firewall_rule" {
    value = azurerm_synapse_firewall_rule.firewall_dev.name  
}

output "synapse_spark_pool" {
    value = azurerm_synapse_spark_pool.sparkpool.name  
}

output "synapse_managed_private_endpoint" {
    value = azurerm_synapse_managed_private_endpoint.private_end_point_dev.name  
}
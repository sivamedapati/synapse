data "azurerm_resource_group" "demo" {
  name = var.resource_group  
}

resource "azurerm_storage_account" "storage_dev" {
  name = var.storage_account
  resource_group_name = data.azurerm_resource_group.demo.name
  location = data.azurerm_resource_group.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind = var.account_kind
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake_dev" {
  name = var.storage_data_lake
  storage_account_id = azurerm_storage_account.storage_dev.id
}

resource "azurerm_synapse_workspace" "ws" {
  name = var.synapse_workspace
  resource_group_name = data.azurerm_resource_group.demo.name
  location = data.azurerm_resource_group.demo.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.datalake_dev.id
  sql_administrator_login = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_login_password
  public_network_access_enabled = true
  managed_virtual_network_enabled = true
  sql_identity_control_enabled = true  
  identity {
    type = "SystemAssigned"
  }
}

dynamic "aad_admin" {
  for_each = try(var.settings.aad_admin, {})
  content {
    login = var.settings.aad_admin.login
    object_id = var.settings.aad_admin.object_id
    tenant_id = var.settings.aad_admin.tenant_id
  }
}

dynamic "customer_managed_key" {
  for_each = try(var.settings.customer_managed_key_versionless_id, null) == null ? [] : [1]
  content {
    key_versionless_id = try(var.settings.customer_managed_key_versionless_id, null)
  }
}

dynamic "github_repo" {
  for_each = try(var.settings.github_repo, {})
  content {
    account_name = var.settings.github_repo.account_name
    branch_name = var.settings.github_repo.project_name
    repository_name = var.settings.github_repo.branch_name
    root_folder = var.settings.github_repo.root_folder
    git_url = var.settings.github_repo.git_url
   }
  }

resource "azurerm_synapse_firewall_rule" "firewall_dev" {
  name = var.firewall_dev
  synapse_workspace_id = azurerm_synapse_workspace.ws.id
  start_ip_address = var.start_ip_address
  end_ip_address = var.end_ip_address
}

resource "azurerm_synapse_spark_pool" "sparkpool" {
  name = var.synapse_spark_pool
  synapse_workspace_id = azurerm_synapse_workspace.ws.id
  node_size_family = var.node_size_family
  node_size = var.node_size
  cache_size = 100
  auto_scale {
    max_node_count = 50
    min_node_count = 3
  }
}

resource "azurerm_synapse_managed_private_endpoint" "private_end_point_dev" {
  name = var.synapse_private_endpoint
  synapse_workspace_id = azurerm_synapse_workspace.ws.id
  target_resource_id = azurerm_storage_account.storage_dev.id
  subresource_name = var.subresource_name
  depends_on = [azurerm_synapse_firewall_rule.firewall_dev]
}


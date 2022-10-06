variable "resource_group" {
  default = "test-rg-1"  
}

variable "storage_account" {
  default = "storage2synapse1"  
}

variable "account_tier" {
  default = "Standard"  
}

variable "account_replication_type" {
  default = "LRS"  
}

variable "account_kind" {
  default = "BlobStorage"  
}

variable "storage_data_lake" {
  default = "datalakedev"  
}

variable "synapse_workspace" {
  default = "testingsynapse"  
}

variable "sql_administrator_login" {
  description = "sql administrator login username"
  type = string
  sensitive = true
}

variable "sq_administrator_login_password" {
  description = "sql administrator login password"
  type = string
  sensitive = true
}

variable "settings" {
  default = null  
}

variable "identity" {
  default = "systemidentity"  
}

variable "node_size" {
  default = "small"  
}

variable "synapse_firewall_rule" {
  default = "firewall_dev"  
}

variable "start_ip_address" {
  default = "0.0.0.0"  
}

variable "end_ip_address" {
  default = "255.255.255.255"
}

variable "synapse_spark_pool" {
  default = "sparkpool"  
}

variable "node_size_family" {
  default = "MemoryOptimized"  
}

variable "synapse_private_endpoint" {
  default = "private-endpoint_dev"  
}

variable "subresource_name" {
  default = "blob"  
}
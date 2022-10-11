variable "resource_group" {
  default = "test-rg-1"  
}

variable "storage_account" {
  description = "fetch storage account from exisitng module"
  type = string  
}

variable "account_tier" {
  description = "account tier"
  type = string  
}

variable "account_replication_type" {
  description = "account replication type"
  type = string  
}

variable "account_kind" {
  description = "account kind"
  type = string  
}

variable "storage_data_lake" {
  description = "data lake"
  type = string  
}

variable "synapse_workspace" {
  description = "workspace name"
  type = string  
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
  description = "settings"
  type = string  
}

variable "identity" {
  description = "identity"
  type = string  
}

variable "node_size" {
  description = "node size"
  type = string  
}

variable "synapse_firewall_rule" {
  description = "firewall rule"
  type = string  
}

variable "start_ip_address" {
  description = "start ip addess"
  type = string  
}

variable "end_ip_address" {
  description = "end ip address"
  type = string
}

variable "synapse_spark_pool" {
  description = "spark pool"
  type = string  
}

variable "node_size_family" {
  description = "node size family"
  type = string  
}

variable "synapse_private_endpoint" {
  description = "private endpoint"
  type = string  
}

variable "subresource_name" {
  description = "sub resource name"
  type = string  
}
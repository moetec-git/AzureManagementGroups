#########################################################
#This are the data sources 
##############################################################

data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

data "azurerm_policy_definition" "this" {
  display_name = "Configure network security groups to enable traffic analytics"

}

data "azurerm_policy_definition" "that" {
  display_name = "Allowed locations"

}

data "azurerm_policy_definition" "then" {
  display_name = "[Preview]: All Internet traffic should be routed via your deployed Azure Firewall"

}


#######################################################
# Resources
######################################################

resource "azurerm_management_group" "this" {
  display_name = var.managementgroup

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}

#Resources to create an Azure Storage account and container#

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "sg001" {
  name     = var.resource_group_name
  location = var.resource_group_location

}

resource "azurerm_storage_account" "sg001" {
  name                     = "sg001${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.sg001.name
  location                 = azurerm_resource_group.sg001.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sg001" {
  name                  = "sg001"
  storage_account_name  = azurerm_storage_account.sg001.name
  container_access_type = "blob"
}


resource "azurerm_key_vault" "this" {
  name                        = "sgoo1"
  location                    = azurerm_resource_group.sg001.location
  resource_group_name         = azurerm_resource_group.sg001.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "6e75e47e-aae7-492d-95f6-10cb97950ea5"

    key_permissions = [
      "Create",
      "Get",
      "Purge",
      "Recover",
      "List"
    ]

    secret_permissions = [
      "Set",
      "List",
      "Get"
    ]

    storage_permissions = [
      "Get"
    ]
  }
}

#Linking my Key Vault and Storage Account together#

resource "azurerm_key_vault_secret" "this" {
  name         = "secret-subscription-id"
  value        = data.azurerm_subscription.current.id
  key_vault_id = azurerm_key_vault.this.id
}


# The setup for management group creation in Azure #
data "azurerm_subscription" "current" {
}

data "azurerm_policy_definition" "that" {
  display_name = "Storage accounts should restrict network access using virtual network rules"
}

resource "azurerm_management_group" "parent" {
  display_name = var.managementgroup

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
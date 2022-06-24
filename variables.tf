#Here is the Variable defined for the Root Management Group#

variable "managementgroup" {
  type = string
  default = "Terraform_Creation"
}

variable "resource_group_name" {
  type = string
  default = "sg001"
}

variable "resource_group_location" {
  type = string
  default = "East US"
}


variable "parameters" {
  default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "DeployIfNotExists",
          "Disabled"
        ],
        Value = "DeployIfNotExists"
      },
      "nsgRegion": {
        "type": "String",
        "metadata": {
          "displayName": "Network security group Region",
          "description": "Configures for network security groups in the selected region only.",
          "strongType": "location"
        }
        value = "South Africa West"
      },
      "storageId": {
        "type": "String",
        "metadata": {
          "displayName": "Storage Resource ID",
          "description": "Resource ID of the storage account where the flow logs are written. Make sure this storage account is located in the selected network security group Region. The format must be: '/subscriptions/{subscription id}/resourceGroups/{resourceGroup name}/providers/Microsoft.Storage/storageAccounts/{storage account name}",
          "assignPermissions": true
        }
        value = "/subscriptions/f20b48e1-b5b8-401e-9541-e954276807cc/resourceGroups/sg001/providers/Microsoft.Storage/storageAccounts/sg0010tmgm"
      },
      "timeInterval": {
        "type": "String",
        "metadata": {
          "displayName": "Traffic analytics processing interval in minutes",
          "description": "Traffic analytics processes blobs at the selected frequency."
        },
        "allowedValues": [
          "10",
          "60"
        ],
        Value = "60"
      },
      "workspaceResourceId": {
        "type": "String",
        "metadata": {
          "displayName": "Workspace resource ID",
          "description": "Log Analytics workspace resource id",
          "assignPermissions": true
        }

        Value = "/subscriptions/f20b48e1-b5b8-401e-9541-e954276807cc/resourcegroups/defaultresourcegroup-cus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-f20b48e1-b5b8-401e-9541-e954276807cc-cus"

      },
      "workspaceRegion": {
        "type": "String",
        "metadata": {
          "displayName": "Workspace region",
          "description": "Log Analytics workspace region",
          "strongType": "location"
        }

        Value = "South Africa West"
      },
      "workspaceId": {
        "type": "String",
        "metadata": {
          "displayName": "Workspace ID",
          "description": "Log Analytics workspace GUID"
        }
        Value = "8accc091-d1e8-4871-9709-22b6c82b256e"
      },
      "networkWatcherRG": {
        "type": "String",
        "metadata": {
          "displayName": "Network Watcher resource group",
          "description": "The Network Watcher regional instance is present in this resource group. The network security group flow logs resources are also created. This will be used only if a deployment is required. By default, it is named 'NetworkWatcherRG'.",
          "strongType": "existingResourceGroups"
        }

        Value = "NetworkWatcherRG"
      },
      "networkWatcherName": {
        "type": "String",
        "metadata": {
          "displayName": "Network Watcher name",
          "description": "The name of the network watcher under which the flow log resources are created. Make sure it belongs to the same region as the network security group."
        }
        Value = "NetworkWatcher_eastus"
      }
    }
}


variable "parameter" {
  default = {
      "listOfAllowedLocations": {
        "type": "Array",
        "metadata": {
          "description": "The list of locations that can be specified when deploying resources.",
          "strongType": "location",
          "displayName": "Allowed locations"
        }

        Value = ["South Africa West", "South Africa", "Central US", "West US"]
                
      }
    }
}

variable "parametere" {
  default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable All Internet traffic should be routed via your deployed Azure Firewall"
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Disabled"
        ],
        Value = "AuditIfNotExists"
      }
    }
}

variable "parameteres" {
  default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "The effect determines what happens when the policy rule is evaluated to match"
        },
        "allowedValues": [
          "audit",
          "Audit",
          "deny",
          "Deny",
          "disabled",
          "Disabled"
        ],
        Value = "Audit"
      }
    }
}


# Variable for Management group #

variable "managementgroup" {
    type = string
    default = "mg-p-Connectivity-001"
  
}

variable "cust_scope" {
    default = "/subscriptions/3328bbe5-2bb4-4517-a3c0-503d05c9292e/resourceGroups/RG1/providers/Microsoft.Storage/storageAccounts/sigavi"
}

variable "cast_scope" {
    default = "/subscriptions/3328bbe5-2bb4-4517-a3c0-503d05c9292e/resourceGroups/RG1"
}

variable "parameters" {
	default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the audit policy"
        },
        "allowedValues": [
          "Audit",
          "Deny",
          "Disabled"
        ],
        Value = "Audit"
      }
    }
}


    variable "watcher" {
        default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "Audit",
          "Disabled"
        ],
        Value = "Audit"
      }
    }
    }
    

    
     variable  "resource" {
        default = {
         "tagName": {
           "type": "String",
          "metadata": {
            "displayName": "Tag Name",
            "description": "Name of the tag, such as 'environment'"
        }
         value = "tobmash"
      },
      "tagValue": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Value",
          "description": "Value of the tag, such as 'production'"
        }
          value = "jirairat"
      }
    }

}


variable "resource_group_location" {
 type = string 
 default = "West US"
}
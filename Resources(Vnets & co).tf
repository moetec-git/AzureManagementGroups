

#Resources to create a Virtual Network
resource "azurerm_virtual_network" "this" {
  name                = "VN-Connectivity-dev001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tags = {
    Environment = "Development"
    Description = "This Vnet is used for resources with the Network on the Cloud."
  }
}

#Azure Firewall Subnet#
resource "azurerm_subnet" "this" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

#This the first Subnet, its network security group and its netwrok security group assignment#
resource "azurerm_subnet" "these" {
  name                 = "Subnet001"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.these.id
  network_security_group_id = azurerm_network_security_group.them.id
}

resource "azurerm_network_security_group" "them" {
  name                = "nsg-sigvnet-dev-002"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-002"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = "Development"
    Description = "This is a securtiy Group."
  }

}


#This is the second Subnet, its network Security Group and its assignment#
resource "azurerm_subnet" "then" {
  name                 = "Subnet-002"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "examples" {
  subnet_id                 = azurerm_subnet.then.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_network_security_group" "this" {
  name                = "nsg-sigvnet-dev-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-001"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    Environment = "Development"
    Description = "This is a securtiy Group."
  }
}


#this is the third subnet, its network security group and its assignment#
resource "azurerm_subnet" "that" {
  name                 = "Subnet003"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "examp" {
  subnet_id                 = azurerm_subnet.that.id
  network_security_group_id = azurerm_network_security_group.then.id
}

resource "azurerm_network_security_group" "then" {
  name                = "nsg-sigvnet-dev-003"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-003"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    Environment = "Development"
    Description = "This is a securtiy Group."
  }
}

#this is the fourth subnet, its network security group and its assignment#

resource "azurerm_subnet" "they" {
  name                 = "Subnet004"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "exampe" {
  subnet_id                 = azurerm_subnet.they.id
  network_security_group_id = azurerm_network_security_group.those.id
}

resource "azurerm_network_security_group" "those" {
  name                = "nsg-sigvnet-dev-004"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-004"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#This is the fifth subnet with Lesser IP Availability. This is just for the Loadbalancrs and Web Application Firewall Policies

resource "azurerm_subnet" "subnet-check" {
  name                 = "Subnet005"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.0.64/26"]
}

resource "azurerm_subnet_network_security_group_association" "examps" {
  subnet_id                 = azurerm_subnet.subnet-check.id
  network_security_group_id = azurerm_network_security_group.thin.id
}

resource "azurerm_network_security_group" "thin" {
  name                = "nsg-sigvnet-dev-005"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-005"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#This is the sixth subnet with Lesser IP Availability. This is just for the Loadbalancrs and Web Application Firewall Policies

resource "azurerm_subnet" "subnet-check1" {
  name                 = "Subnet006"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.64.0/26"]
}

resource "azurerm_subnet_network_security_group_association" "exam" {
  subnet_id                 = azurerm_subnet.subnet-check1.id
  network_security_group_id = azurerm_network_security_group.thick.id
}

resource "azurerm_network_security_group" "thick" {
  name                = "nsg-sigvnet-dev-006"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-006"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "this" {
  name                = "test-p-ip"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Development"
    Description = "This is a test-p-ip."
  }
}

resource "azurerm_firewall" "this" {
  name                = "afw-connectivity-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }
  tags = {
    Environment = "Development"
    Description = "This is the Azure Firewall."
  }
}

resource "azurerm_firewall_policy" "these" {
  name                = "fp-dev-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  tags = {
    environment = "development"
    description = "policies to guide the azure firewall activities"
  }
}



#Resources to create a VPN Gateway to help communicate with the Onpremise#
resource "azurerm_virtual_wan" "this" {
  name                = "vwan-dev-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags = {
    Environment = "Development"
    Description = "The Azure Virtual Wan."
  }
}

resource "azurerm_virtual_hub" "this" {
  name                = "hub-dev-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  virtual_wan_id      = azurerm_virtual_wan.this.id
  address_prefix      = "10.0.1.0/24"
}

resource "azurerm_vpn_gateway" "this" {
  name                = "vpng-dev-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  virtual_hub_id      = azurerm_virtual_hub.this.id
}

#Resources to create a Load Banlancer and a load balancer public address#
resource "azurerm_public_ip" "that" {
  name                = "PIP-LB-connectivity-002"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "this" {
  name                = "Test-LoadBalancer"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.that.id
  }
  tags = {
    Environment = "Development"
    Description = "The Azure Load balancer."
  }
}


# The Firewall Policy Rules #
resource "azurerm_firewall_policy_rule_collection_group" "This" {
  name               = "fwpolicy-connectivity"
  firewall_policy_id = azurerm_firewall_policy.these.id
  priority           = 500
  application_rule_collection {
    name     = "app_rule_collection1"
    priority = 500
    action   = "Deny"
    rule {
      name = "app_rule_collection1_rule1"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["*"]
      destination_fqdns = ["microsoft.com"]
    }
  }

  network_rule_collection {
    name     = "network_rule_collection1"
    priority = 400
    action   = "Allow"
    rule {
      name                  = "network_rule_collection1_rule1"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["*"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
  }

}


resource "azurerm_network_interface" "then" {
  name                = "nic-prod-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.then.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "this" {
  name                = "vmcon-dev-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.then.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

#Public IP addresses created for the sake of the VM
resource "azurerm_public_ip" "these" {
  name                = "PIP-vm-connectivity-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
}







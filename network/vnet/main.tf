resource "azurerm_virtual_network" "ags-vnet" {
  name                = var.network_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

}
resource "azurerm_subnet" "ags-subnet" {
 count                 = var.subnet_count
  name                 = "${var.subnet_name}${count.index}"
    resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.ags-vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space, 8, count.index)]
}

resource "azurerm_public_ip" "ags-public-ip" {
  count               = var.public_ip_name_count
  name                = "${var.public_ip_name}${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "ags-nic" {
  count               = var.network_interface_count
  name                = "${var.network_interface_name}${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ags-subnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ags-public-ip[count.index].id
  }
}
resource "azurerm_network_security_group" "ags-nsg" {
  name                = var.network_security_group_name[0].name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.network_security_group_name[0].rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "ags-subnet-nsg-association" {
  count                 = var.subnet_count
  subnet_id             = azurerm_subnet.ags-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.ags-nsg.id
}
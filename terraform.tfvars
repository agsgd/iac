resource_group_name     = "module-resource-group"
location                = "East US"
subnet_name             = "subnet"
vnet_address_space      = "10.11.0.0/16"
network_name            = "vnet"
subnet_count            = 2
public_ip_name_count    = 2
network_interface_count = 2
public_ip_name          = "public-ip"
network_interface_name  = "nic"
network_security_group_name = [
  {
    name = "nsg"
    rules = [
      {
        name                       = "allow-ssh"
        priority                   = 1000
        destination_port_range     = "22"
      },
      {
        name                       = "allow-http"
        priority                   = 2000
        destination_port_range     = "80"
      },
            {
        name                       = "allow-rdp"
        priority                   = 4000
        destination_port_range     = "3389"
      },
        {
            name                       = "allow-https"
            priority                   = 3000
            destination_port_range     = "443"
        }
    ]
  }
]
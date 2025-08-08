module "resource_group" {
  source              = "./general/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}
module "network" {
  source                  = "./network/vnet"
  resource_group_name     = var.resource_group_name
  location                = var.location
  network_name            = var.network_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_count            = var.subnet_count
  public_ip_name_count    = var.public_ip_name_count
  network_interface_count = var.network_interface_count
  public_ip_name          = var.public_ip_name
  network_interface_name  = var.network_interface_name
  network_security_group_name = var.network_security_group_name
  
  
    # Ensure the network module depends on the resource group module
  depends_on              = [module.resource_group]
}
module "virtual_machine" {
  source                = "./compute/virtual_machine"
  resource_group_name   = var.resource_group_name
  location              = var.location
  virtual_machine_name  = var.virtual_machine_name
  virtual_machine_size  = var.virtual_machine_size
  network_interface_ids = module.network.network_interface_ids
  admin_username        = var.admin_username
  
  
  # Ensure the virtual machine module depends on the network module
  depends_on            = [module.network]
}
resource "azurerm_linux_virtual_machine" "ags-virtual_machine" {
  count                = var.virtual_machine_count
  name                 = "${var.virtual_machine_name}-${count.index}"
  resource_group_name   = azurerm_resource_group.ags-resource-group.name
  location              = azurerm_resource_group.ags-resource-group.location
  size                  = var.virtual_machine_size
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  admin_username        = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [for nic in azurerm_network_interface.ags-nic : nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "24.04-lts"
    version   = "latest"
  }


}
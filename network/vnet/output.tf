output "network_interface_id" {
  value = azurerm_network_interface.ags-nic[*].id
  description = "The ID of the network interface associated with the Azure virtual machine."
}
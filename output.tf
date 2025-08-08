output "public_ip" {
  value = azurerm_public_ip.ags-public-ip.ip_address
  description = "The public IP address of the Azure resource."
}
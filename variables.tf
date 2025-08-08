variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string

}
variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string

}


# note: The following variables are used in the network module

variable "network_name" {
  description = "The name of the resource group to create."
  type        = string
}
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet to create within the virtual network."
  type        = string
}
variable "subnet_count" {
  description = "The number of subnets to create within the virtual network."
  type        = number
}
variable "public_ip_name_count" {
  description = "The name of the public IP address to create."
  type        = number
}
variable "network_interface_count" {
  description = "The name of the public IP address to create."
  type        = number
}
variable "public_ip_name" {
  description = "The name of the public IP address to create."
  type        = string
}
variable "network_interface_name" {
  description = "The name of the network interface to create."
  type        = string
}
variable "network_security_group_name" {
  description = "The name of the network security group to create."
  type        = list(object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      destination_port_range     = string
     
    }))
  }))
}
# virtual machine specific variables
variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The username for the virtual machine administrator."
  type        = string
}
variable "virtual_machine_count" {
  description = "The number of virtual machines to create."
  type        = number
}
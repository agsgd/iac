variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}
variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string

}
variable "location" {
  description = "The Azure region where the resource group will be created."
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
variable "network_interface_ids" {
  description = "List of network interface IDs to associate with the virtual machines."
  type        = list(string)
  default     = []
}
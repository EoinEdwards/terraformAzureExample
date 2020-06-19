resource "azurerm_resource_group" "terraform_rg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "ee_vnet" {
  name = "EE-Terraform-VNet"
  address_space = [var.vnet_cidr]
  location = var.location
  resource_group_name   = azurerm_resource_group.terraform_rg.name

  tags = {
    group = "Eoin"
  }
}

resource "azurerm_subnet" "ee_subnet_1" {
  name = "EE-Subnet-1"
  address_prefixes = [var.subnet1_cidr]
  virtual_network_name = azurerm_virtual_network.ee_vnet.name
  resource_group_name = azurerm_resource_group.terraform_rg.name
}

resource "azurerm_subnet" "ee_subnet_2" {
  name = "EE-Subnet-2"
  address_prefixes = [var.subnet2_cidr]
  virtual_network_name = azurerm_virtual_network.ee_vnet.name
  resource_group_name = azurerm_resource_group.terraform_rg.name
}
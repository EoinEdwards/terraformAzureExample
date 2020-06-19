resource "azurerm_public_ip" "ee_pip" {
  name = "EE-Terraform-PIP"
  location = var.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  allocation_method = "Static"
  tags = {
    group = "Eoin"
  }
}

resource "azurerm_network_interface" "public_nic" {
  name       = "EE-Terraform-Web"
  location       = var.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name = "EE-Terraform-WebPrivate"
    subnet_id = azurerm_subnet.ee_subnet_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ee_pip.id
  }
  tags = {
    group = "Eoin"
  }
}

resource "azurerm_public_ip" "ee_db_pip" {
  name                  = "EE-Terraform-DB-PIP"
  location              = var.location
  resource_group_name   = azurerm_resource_group.terraform_rg.name
  allocation_method = "Static"

  tags = {
    group = "Eoin"
  }
}

resource "azurerm_network_interface" "private_nic" {
  name = "EE-Terraform-DB"
  location = var.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name = "EE-Terraform-DBPrivate"
    subnet_id = azurerm_subnet.ee_subnet_2.id
    private_ip_address_allocation = "Static"
    private_ip_address = "192.168.2.5"
    public_ip_address_id        = azurerm_public_ip.ee_db_pip.id
  }
  tags = {
    group = "Eoin"
  }
}
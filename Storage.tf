resource "azurerm_storage_account" "ee_storage" {
  name = "eeterraform1"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    group = "Eoin"
  }
}

resource "azurerm_storage_container" "ee_cont" {
  name = "vhds"
  storage_account_name = azurerm_storage_account.ee_storage.name
  container_access_type = "private"
}
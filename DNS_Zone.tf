resource "azurerm_dns_zone" "ee_dns" {
  name                  = "yourdomain.com"
  resource_group_name   = azurerm_resource_group.terraform_rg.name
}

resource "azurerm_dns_a_record" "ee_a" {
  name      = "ee-a_record"
  zone_name = azurerm_dns_zone.ee_dns.name
  resource_group_name   = azurerm_resource_group.terraform_rg.name
  ttl = 300
  records = [azurerm_public_ip.ee_pip.ip_address]
}
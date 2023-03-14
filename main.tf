provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "infra" {
  name = var.resource_group_name
}

resource "azurerm_public_ip_prefix" "infra" {
  name                = var.pip_prefix
  location            = data.azurerm_resource_group.infra.location
  resource_group_name = data.azurerm_resource_group.infra.name
  prefix_length       = 28
  tags                = var.tags
}

resource "azurerm_public_ip" "infra" {
  name                = var.natGWIPName
  location            = data.azurerm_resource_group.infra.location
  resource_group_name = data.azurerm_resource_group.infra.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_nat_gateway" "infra" {
  name                = var.natGWName
  location            = data.azurerm_resource_group.infra.location
  resource_group_name = data.azurerm_resource_group.infra.name
  # public_ip_address_ids   = [azurerm_public_ip.infra.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 120
  tags                    = var.tags
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "infra" {
  nat_gateway_id      = azurerm_nat_gateway.infra.id
  public_ip_prefix_id = azurerm_public_ip_prefix.infra.id
}

data "azurerm_subnet" "infra" {
  name                 = var.subnet-name
  resource_group_name  = var.vnet-rg-name
  virtual_network_name = var.vnet-name
}

resource "azurerm_subnet_nat_gateway_association" "infra" {
  subnet_id      = data.azurerm_subnet.infra.id
  nat_gateway_id = azurerm_nat_gateway.infra.id
}


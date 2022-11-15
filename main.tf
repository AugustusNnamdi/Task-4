


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.29.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.prefix
  location = "West Europe"
}

#create a virtual network

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# created subnet interface
resource "azurerm_subnet" "subnet" {
  name                 = "sub_net"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_app_service_plan" "asp" {
  name                = "asp-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind     = "Linux"
  reserved = true


  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
    Creator = "Jklone"
  }
}

/* /* # Settings for private Container Registires 
locals {
 en_variables = {
	DOCKER_RESGISTRY_SERVER_URL		= "URL"
	DOCKER_RESGISTRY_SERVER_USERNAME	= "USERNAME"
	DOCKER_RESGISTRY_SERVER_PASSWORD	= "PASSWORD" */


resource "azurerm_app_service" "as" {
  name                = "${var.prefix}-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|nginx:latest"
    always_on        = "true"
  }

  tags = {
    image = "Nginx"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}






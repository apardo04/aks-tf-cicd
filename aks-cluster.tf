resource "azurerm_resource_group" "aks-rg" {
  name     = "aks-rg"
  location = var.region
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myapp-aks"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = "myapp-aks"

  default_node_pool {
    name                = "default"
    #node_count          = 2
    max_count           = 3
    min_count           = 1
    enable_auto_scaling = true
    vm_size             = "Standard_B2s"
    os_disk_size_gb     = 30
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Test"
    component   = "aks"
  }
}
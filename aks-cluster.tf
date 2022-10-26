resource "azurerm_resource_group" "default" {
  name     = "aks-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "myapp-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "myapp-aks"

  default_node_pool {
    name                = "default"
    node_count          = 2
    max_count           = 3
    min_count           = 1
    enable_auto_scaling = true
    vm_size             = "Standard_B1s"
    os_disk_size_gb     = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.secret
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Test"
    component   = "aks"
  }
}
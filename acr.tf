resource "azurerm_container_registry" "acr" {
  name                     = "acradrianpa"
  resource_group_name      = azurerm_resource_group.aks-rg.name
  location                 = azurerm_resource_group.aks-rg.location
  sku                      = "Standard"
  admin_enabled            = false
}

/*
# Need to do this with Owner account. Because Contributor does not allow you to assign roles in Azure RBAC.
resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = azurerm_resource_group.aks-rg.id
  principal_id                     =  azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  skip_service_principal_aad_check = true
}
*/


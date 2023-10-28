// Inputs
@description('ContainerRegistry Name')
param containerRegistryName string = toLower('ACR${uniqueString(resourceGroup().id)}')

@description('location')
param location string =  resourceGroup().location


// ContainerRegistry
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}


// Outputs
output containerRegistryName string = containerRegistry.name
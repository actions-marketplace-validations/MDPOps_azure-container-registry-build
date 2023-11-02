// Inputs
@description('ContainerRegistry Name')
param containerRegistryName string = ''

@description('Location')
param location string = resourceGroup().location


// ContainerRegistry
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = if (empty(containerRegistryName)) {
  name: toLower('arc${uniqueString(resourceGroup().id)}')
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

resource containerRegistryReference 'Microsoft.ContainerRegistry/registries@2022-12-01' existing = if (!empty(containerRegistryName)) {
  name: containerRegistryName
}


// Outputs
output id string = empty(containerRegistryName) ? containerRegistry.id : containerRegistryReference.id
output name string = empty(containerRegistryName) ? containerRegistry.name : containerRegistryReference.name
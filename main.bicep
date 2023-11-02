// Inputs
@description('ContainerRegistry Name')
param containerRegistryName string = ''

@description('Location')
param location string = resourceGroup().location


// ContainerRegistry
module containerRegistry 'modules/containerRegistry.bicep' =  {
  name: 'containerRegistry'
  params: {
    containerRegistryName: containerRegistryName
    location: location
  }
}


// Outputs
output containerRegistryName string = containerRegistry.outputs.name
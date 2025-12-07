// Inputs
@description('ContainerRegistry Name')
param containerRegistryName string = ''


// Variables
@description('sku=[Basic], [Standard], [Premium]')
@allowed(['Basic', 'Standard', 'Premium', ''])
param sku string = ''

var skuName = {
  Basic: 'Basic'
  Standard: 'Standard'
  Premium: 'Premium'
}

@description('location')
param location string = resourceGroup().location


// ContainerRegistry
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: !empty(containerRegistryName) ? containerRegistryName : toLower('arc${uniqueString(resourceGroup().id)}')
  location: location
  sku: {
    name: !empty(sku) ? skuName[sku] : skuName.Basic
  } 
  properties: {
    adminUserEnabled: true
  } 
}


// Outputs
output id string = containerRegistry.id
output name string = containerRegistry.name
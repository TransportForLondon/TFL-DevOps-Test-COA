param name string
param location string
param tags object = {}

param appCommandLine string = ''
param applicationInsightsName string = ''
param appServicePlanId string
param appSettings object = {}
param keyVaultName string
param serviceName string = 'api'

module api '../core/host/appService.bicep' = {
  name: '${name}-app-module'
  params: {
    name: name
    location: location
    tags: union(tags, { 'azd-service-name': serviceName})
    allowAllOrigins: true
    appCommandLine: appCommandLine
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlanId
    appSettings: appSettings
    keyVaultName: keyVaultName
    runtimeName: 'dotnetcore'
    runtimeVersion: '8.0'
    scmDoBuildDuringDeploymentBool: false
  }
}

output SERVICE_API_IDENTITY_PRINCIPAL_ID string = api.outputs.identityPrincipalId
output SERVICE_API_NAME string = api.outputs.name
output SERVICE_API_URI string = api.outputs.uri

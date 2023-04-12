// Define a parameter to pass in the environment name
param environmentName string

// Define variables for location and SKU
var location = 'westeurope'

// Define a resource group for the BI infrastructure
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-bi-${environmentName}' // Resource group name with the environment name passed in as a parameter
  location: location // Use the location variable defined above
}

// Define a SQL Server instance
resource sqlServer 'Microsoft.Sql/servers@2021-08-01-preview' = {
  name: 'sql-bi-${environmentName}' // SQL Server instance name with the environment name passed in as a parameter
  location: location // Use the location variable defined above
  resourceGroup: rg // Use the resource group defined above
  properties: {
    administratorLogin: '<admin_login>' // Replace with appropriate values
    administratorLoginPassword: '<admin_password>' // Replace with appropriate values
    version: '12.0'
  }
}

// Define a SQL Database
resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  name: 'sqldb-bi-${environmentName}' // SQL Database name with the environment name passed in as a parameter
  location: location // Use the location variable defined above
  resourceGroup: rg // Use the resource group defined above
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    createMode: 'Default'
    edition: 'Basic' // Options are 'Basic', 'BusinessCritical', 'GeneralPurpose', 'Premium' and 'Standard'
  }
  dependsOn: [
    sqlServer // Make sure the SQL Server instance is deployed first
  ]
}

// Define a Data Factory instance
resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: 'adf-bi-${environmentName}' // Data Factory instance name with the environment name passed in as a parameter
  location: location // Use the location variable defined above
  resourceGroup: rg // Use the resource group defined above
}

// Define a Storage Account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'sabi${uniqueString(environmentName)}' // Storage Account name with the environment name passed in as a parameter
  location: location // Use the location variable defined above
  resourceGroup: rg // Use the resource group defined above
}

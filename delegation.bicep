@description('Tenant ID da empresa SaaS (onde a aplicação está registrada)')
param managedByTenantId string = 'f988766b-1dc1-4db1-973e-611897dbf32a'

@description('Object ID da aplicação que receberá o acesso')
param principalId string = '706b128a-346d-47d1-bfd5-bc9513440f6d'

@description('Nome da aplicação exibido para o cliente')
param principalDisplayName string = 'SaaS Cloud Cost App'

@description('Nome amigável da delegação')
param offerName string = 'Delegação de Custos para SaaS'

@description('Descrição da delegação')
param offerDescription string = 'Concede acesso Billing Reader à aplicação SaaS para análise de custos.'

resource delegation 'Microsoft.ManagedServices/registrationDefinitions@2019-09-01' = {
  name: guid(offerName)
  properties: {
    registrationDefinitionName: offerName
    description: offerDescription
    managedByTenantId: managedByTenantId
    authorizations: [
      {
        principalId: principalId
        principalIdDisplayName: principalDisplayName
        roleDefinitionId: 'fa23ad8b-c56e-40d8-ac0c-ce449e1d2c64' // Billing Reader
      }
    ]
  }
}

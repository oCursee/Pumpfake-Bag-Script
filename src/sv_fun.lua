ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('pumpfakebag', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('curse-attach', source)   
      print('has item')
end)


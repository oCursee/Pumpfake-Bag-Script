ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('pumpfakebag', function(source)
    TriggerClientEvent('curse-attach', source)  
    --TriggerClientEvent('at', source)    
end)


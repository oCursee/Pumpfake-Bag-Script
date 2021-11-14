

local ped = PlayerPedId()




isathreat = false

RegisterNetEvent('curse-attach')
AddEventHandler('curse-attach', function ()
    Citizen.CreateThread(function()
        isathreat = true
        while true do
            Wait(0)
            local ped = PlayerPedId()
        playAnim('combat@aim_variations@1h@gang', 'aim_variation_a', 10000)
        bag = CreateObject(GetHashKey("prop_paper_bag_01"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(bag, ped, GetPedBoneIndex(ped, 57005), 0.2, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) 
        break
        end
        
    end)
    
      
      
end)

RegisterNetEvent('at')
AddEventHandler('at', function ()
        attachBags()
      isathreat = true
end)


function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

function attachBags()
    bag = CreateObject(GetHashKey("prop_paper_bag_01"), 0, 0, 0, true, true, true)
      AttachEntityToEntity(bag, ped, GetPedBoneIndex(ped, 57005), 0.2, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) 
end


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsControlJustPressed(0, 73) and isathreat == true then
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            DeleteObject(bag)  
            ClearPedTasksImmediately(ped)
           -- exports['mythic_notify']:SendAlert('inform', 'You yank the bag off of your hand.')
            isathreat = false
            
        end
    end
end)






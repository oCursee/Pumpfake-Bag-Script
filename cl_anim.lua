local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX              = nil
local PlayerData = {}
local ped = PlayerPedId()


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

isathreat = false

RegisterNetEvent('curse-attach')
AddEventHandler('curse-attach', function ()
  --  LoadDict('combat@aim_variations@1h@gang')
    RequestAnimDict("combat")
    RequestAnimDict("combat@aim_variations")
    RequestAnimDict("combat@aim_variations@1h@gang")
  --  while (not HasAnimDictLoaded("combat@aim_variations@1h@gang")) do Citizen.Wait(0) end
    TaskPlayAnim(ped, 'combat@aim_variations@1h@gang', 'aim_variation_a', 5.0, -1, -1, 50, 0, false, false, false)
    bag = CreateObject(GetHashKey("prop_paper_bag_01"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(bag, ped, GetPedBoneIndex(ped, 57005), 0.2, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
    isathreat = true
    -----------------------------------------Uncomment below if you want a timer, and after it runs out it drops the bag itself.
    --Citizen.Wait(180000)
    --SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
    --DeleteObject(bag)  
    --ClearPedTasksImmediately(ped)
    --exports['mythic_notify']:SendAlert('inform', 'Your hand gets irritated from the bag, and you take it off.')
end)


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 73) and isathreat == true then
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            DeleteObject(bag)  
            ClearPedTasksImmediately(ped)
            exports['mythic_notify']:SendAlert('inform', 'You yank the bag off of your hand.')
            isathreat = false
            
        end
    end
end)





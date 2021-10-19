RegisterNetEvent('ObjectDeleteGunOn')
RegisterNetEvent('ObjectDeleteGunOff')
RegisterNetEvent('noPermissions')
local toggle = false

AddEventHandler('ObjectDeleteGunOn', function()
	if toggle == false then
		drawNotification("~g~Object Delete Gun Enabled!")
		toggle = true 
	else -- if not
		drawNotification('~y~Object Delete Gun is already enabled!') 
	end
end)

AddEventHandler('ObjectDeleteGunOff', function() 
	if toggle == true then 
		drawNotification('~b~Object Delete Gun Disabled!') 
		toggle = false 
	else -- if not
		drawNotification('~y~Object Delete Gun is already disabled!') 
	end
end)

AddEventHandler('noPermissions', function() 
	drawNotification("~r~You have insufficient permissions to activate the Object Delete Gun.") 
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
		if toggle then 
			if IsPlayerFreeAiming(PlayerId()) then 
				local entity = getEntity(PlayerId()) 
				if IsPedShooting(GetPlayerPed(-1)) then 
					SetEntityAsMissionEntity(entity, true, true) 
					DeleteEntity(entity)
				end
			end
		end
	end
end)

function getEntity(player) 
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

function drawNotification(text) --Just Don't Edit!
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
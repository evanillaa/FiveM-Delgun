local everyoneAllowed = false -- If set to true everyone can use. If set to false it will use the permission system below.

local allowed =  
{
	"steam:000000000000000",
	"steam:000000000000001",
	"steam:000000000000003"
}	


AddEventHandler('chatMessage', function(source, n, msg) 
	local Message = string.lower(msg)
	if Message == "/delgun on" then 
		CancelEvent() 
		local identifier = GetPlayerIdentifiers(source)[1] 
		if everyoneAllowed == true then 
			TriggerClientEvent('ObjectDeleteGunOn', source)
		else -- if not
			if checkAllowed(identifier) then 
				TriggerClientEvent('ObjectDeleteGunOn', source) 
			else -- if not
				TriggerClientEvent('noPermissions', source) 
			end
		end
	elseif Message == "/delgun off" then 
		CancelEvent()
		TriggerClientEvent('ObjectDeleteGunOff', source)
	end
end)

function checkAllowed(id) 
	for k, v in pairs(allowed) do
		if id == v then -- 
			print('Returns true')
			return true
		end
	end
	
	return false 
end
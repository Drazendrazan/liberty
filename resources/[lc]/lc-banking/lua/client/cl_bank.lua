local notified = false
local lastNotified = 0

local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042}, 
	{name="Bank", id=106, x=241.610, y=225.120, z=106.286},
	{name="Bank", id=108, x=1175.064, y=2706.643, z=38.094}
}	


RegisterNetEvent("qb-banking:client:ExtNotify")
AddEventHandler("qb-banking:client:ExtNotify", function(msg)
	if (not msg or msg == "") then return end

	QBCore.Functions.Notify(msg)
end)

--[[ Show Things ]]--
Citizen.CreateThread(function()
	for k,v in ipairs(banks) do
	  local blip = AddBlipForCoord(v.x, v.y, v.z)
	  SetBlipSprite(blip, v.id)
	  SetBlipDisplay(blip, 4)
	  SetBlipScale  (blip, 1.0)
	  SetBlipColour (blip, 2)
	  SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(tostring(v.name))
	  EndTextCommandSetBlipName(blip)
	end
end)


RegisterNetEvent('qb-banking:client:bank:openUI')
AddEventHandler('qb-banking:client:bank:openUI', function() -- this one bank from target models
	if not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "Opening Bank", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceled', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)
RegisterNetEvent('qb-banking:client:atm:openUI')
AddEventHandler('qb-banking:client:atm:openUI', function() -- this opens ATM
	if not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "Opening ATM", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceled', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)

-- RegisterNetEvent('qb-banking:client:atm:openUI')
-- AddEventHandler('qb-banking:client:atm:openUI', function() -- this opens ATM	
-- 	ToggleUI()
-- end)

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent("qb-banking:client:givecashaniamtion")
AddEventHandler('qb-banking:client:givecashaniamtion', function()
    loadAnimDict('friends@laf@ig_5')
    TaskPlayAnim(PlayerPedId(), 'friends@laf@ig_5', 'nephew', 5.0, 1.0, 5.0, 48, 0.0, 0, 0, 0)
    Citizen.Wait(1500)
    StopAnimTask(PlayerPedId(), "friends@laf@ig_5", "nephew", 1.0)
end)

local ATMModels = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm"
}
exports['lc-target']:AddTargetModel(ATMModels, {
    options = {
        {
            --event = 'qb-atms:server:enteratm',
            event = 'qb-banking:client:atm:openUI',
            type = 'client',
            icon = "fas fa-credit-card",
            label = "Kasuta Pangaautomaati",
        },
		{
			type = "client",
			event = "mt-atmrobbery:client:roubar",
			icon = "fas fa-user-secret",
			label = "Hack ATM",
	    },
    },
    distance = 1.5,
})
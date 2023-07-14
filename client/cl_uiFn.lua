-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 03/07/2023 at 02:53
-- Name: [COURS]/krp_pets/client/cl_uiFn.lua

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ZODWorks = exports["ZODWorks"]:getSharedObject()
onFocus = false
haveAPetOnMap = false
Pet = nil

Citizen.CreateThread(function()
    while(onFocus) do
        Citizen.Wait(0)
        DisableControlAction(0, 142, onFocus)
        DisableControlAction(0, 18, onFocus)
        DisableControlAction(0, 322, onFocus)
        DisableControlAction(0, 106, onFocus)
    end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("discord", function(data)
    ZODWorks.Player:notify(Locales.discord[CurrentLocale])
end)

RegisterNUICallback("removePet", function(data)
    DeletePed(Pet)
    Pet = nil
    haveAPetOnMap = false
    SetDisplay(false)
end)

RegisterNUICallback("submit", function(data)
    if(not haveAPetOnMap) then
        Pet = ZODWorks.KRPPets:spawnPet(data.race, data.name)

        Citizen.CreateThread(function()
            while(Pet ~= nil) do
                local coordspet = GetEntityCoords(Pet)

                ZODWorks.Game:create3dText(data.name, vector3(coordspet.x, coordspet.y, coordspet.z + 0.5),
                        { r = 255, g = 255, b = 255, a = 255 }, 4, true)
                Citizen.Wait(1)
            end
        end)
    else
        ZODWorks.Player:notify(Locales.alreadyOutside[CurrentLocale])
    end

    haveAPetOnMap = true
    SetDisplay(false)
end)

---Display the UI interface.
---@param bool boolean Set true for active.
function SetDisplay(bool)
    local petsList = ZODWorks.KRPPets:getPetsList()

    onFocus = bool
    SetNuiFocus(bool, bool)

    SendNUIMessage({
        type = "ui",
        status = bool,
        pets = petsList,
    })
end
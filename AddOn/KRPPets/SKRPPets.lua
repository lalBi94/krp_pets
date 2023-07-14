-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 03/07/2023 at 04:05
-- Name: [Zod]/ZODWorks/shared/AddOns/KRPPets/SKRPPets

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("zod::getPetsList", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll(
        "SELECT `pet`, `name` FROM `krp_pets` WHERE identifier=@i", {
            ["i"] = identifier
        },function(data)
            if(data) then
                TriggerClientEvent("zod:receivePetsList", _src, data)
            end
        end)
end)

RegisterNetEvent("zod::addPetToPlayer", function(pet, name)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = xPlayer.identifier

    MySQL.Async.insert(
        "INSERT INTO `krp_pets` (identifier, pet, name) VALUES (@i, @p, @n)", {
            ["i"] = identifier, 
            ["p"] = pet, 
            ["n"] = name
        }, function(id)
            if(id == 0) then
                TriggerClientEvent("zod:petCreated", _src, { pet = pet, name = name })
            end
        end)
end)
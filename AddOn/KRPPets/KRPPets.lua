-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 03/07/2023 at 03:53
-- Name: [Zod]/ZODWorks/client/AddOns/KRPPets/KRPPets

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
ZODWorks.KRPPets = {}

PetsList = nil
RegisterNetEvent("zod:receivePetsList", function(data)
    PetsList = data
end)

RegisterNetEvent("zod:petCreated", function(data)
    ESX.ShowNotification((Locales.KRPPets.texts.petCreate[CurrentLocale]):format(data.pet, data.name))
end)

--- Add a pet to a player.
---@param pet string The pet identifier.
---@param name string The pet name.
---@return void
function ZODWorks.KRPPets:addPetToPlayer(pet, name)
    ZODWorks.Game:Trigger("zod::addPetToPlayer", pet, name)
end

--- Get the player pets list
---@return table
function ZODWorks.KRPPets:getPetsList()
    if(PetsList ~= nil) then
        return PetsList
    else
        ZODWorks.Game:Trigger("zod::getPetsList")

        while(PetsList == nil) do
            Wait(0)
        end
    
        return PetsList
    end
end

--- Spawn a pet
---@author Onde Folie (ma womaan)
---@param race string The pet's race.
---@param name string The pets name (OPTIONNAL) { rottweiler, cat, husky, retriever, westy, crow }.
---@return Ped
function ZODWorks.KRPPets:spawnPet(race, name)
    pets = {
        ["rottweiler"] = {
            model = "a_c_chop",
            hash = GetHashKey("a_c_chop"),
            type = 0
        }, ["cat"] = {
            model = "a_c_cat_01",
            hash = GetHashKey("a_c_cat_01"),
            type = 0
        }, ["husky"] = {
            model = "a_c_husky",
            hash = GetHashKey("a_c_husky"),
            type = 0
        }, ["retriever"] = {
            model = "a_c_retriever",
            hash = GetHashKey("a_c_retriever"),
            type = 0
        }, ["westy"] = {
            model = "a_c_westy",
            hash = GetHashKey("a_c_westy"),
            type = 0
        }, ["crow"] = {
            model = "a_c_crow",
            hash = GetHashKey("a_c_crow"),
            type = 0
        }, ["boar"] = {
            model = "a_c_crow",
            hash = GetHashKey("a_c_boar"),
            type = 0
	}, ["coyot"] = {
            model = "a_c_coyote",
            hash = GetHashKey("a_c_coyote"),
            type = 0
	}
    }

    if(not ZODWorks.Utils:tableContainsKey(pets, race)) then
        ESX.ShowNotification((Locales.KRPPets.texts.wrong[CurrentLocale]):format(race))
        return nil
    end

    RequestModel(pets[race].hash)
    while not HasModelLoaded(pets[race].model) do
        Citizen.Wait(1)
    end

    AddRelationshipGroup("petmaster")

    local me = PlayerPedId(-1)
    local coords = GetEntityCoords(me)
    local heading = GetEntityHeading(me)

    pet = CreatePed(pets[race].type, pets[race].hash, coords.x + 1, coords.y, coords.z-0.20, heading, true, true)
    FreezeEntityPosition(pet, false)
    SetPedRelationshipGroupHash(me, GetHashKey("petmaster"))
    SetPedRelationshipGroupHash(pet, GetHashKey("petmaster"))
    TaskGoToEntity(pet, me, -1, 200, 100.0, 1073741824, 0)
    SetPedMoveRateOverride(pet, 22.50)

    ESX.ShowNotification((Locales.KRPPets.texts.succes[CurrentLocale]):format(name))
    return pet
end

setmetatable(ZODWorks, { __index = ZODWorks.KRPPets })
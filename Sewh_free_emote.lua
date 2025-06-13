--open source Subscribe Cáo Mod pls D:
--do you think of a cat? lol
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local window = library:Window("S.e.w.h Free Emote")

local emoteNames = {
    "Birthday",
    "Boppin",
    "ByeByeBye",
    "Caramelldansen",
    "CatBath",
    "ChampionofLight",
    "Chess",
    "ChillSit",
    "ClassC14",
    "Cosmic",
    "CryingDance",
    "DancingDomino",
    "DieLit",
    "Doodle",
    "DoshBag",
    "DoshSpread",
    "FollowMe",
    "Ena",
    "Gacha",
    "GetDown",
    "Getaway",
    "Griddy",
    "HeatAttack",
    "Hug",
    "Hyadain",
    "InternetYamero",
    "Jiggy",
    "KarateMan",
    "KillMeBaby",
    "KontonBoogie",
    "Kyoufuu",
    "LaidBackShuffle",
    "LasPlagas",
    "LethalCompany",
    "LiarDancer",
    "Lockstep",
    "LoveHate",
    "March",
    "Melancholy",
    "Mesmerizer",
    "Number",
    "OhNoes",
    "OneTwoThree",
    "PartyHips",
    "PbjTime",
    "PoPiPo",
    "PointAt",
    "RestockIt",
    "Rin",
    "RollingStar",
    "SaiyanWalk",
    "Scary",
    "SewhStomp",
    "Shika",
    "SkeletonOrchestra",
    "SlenderJump",
    "Slick",
    "Smug",
    "Sneaky",
    "Static",
    "SuperJumpy",
    "Territory",
    "TuringLove",
    "WasntMe",
    "WhamWham",
    "WhatUWant",
    "WildSide",
    "Yoinky",
    "Yorokonde",
    "Logansbirthday"
}

local selectedEmote = emoteNames[1]
local Synchronous = game:GetService("ReplicatedStorage").Communication.EventObjects.Synchronous
local Off = false
local hook = false

local function setupCancelHook()
    if hook then return end
    hook = true

    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = { ... }

        if Off and self == Synchronous and method == "InvokeServer" and args[1] == "CancelEmote" then
            return nil
        end

        return old(self, ...)
    end)
end

window:Dropdown("Choose Emote", emoteNames, function(option)
    selectedEmote = option
end)

window:Toggle("On Emote", false, function(state)
    if state then
        setupCancelHook()
        Off = true
        Synchronous:InvokeServer("TryEmote", selectedEmote)
    else
        Off = false
    end
end)

window:Label("Credits: Cáo Mod", true)

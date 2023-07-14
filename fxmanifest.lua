fx_version 'adamant'
game 'gta5'
lua54 'yes'

author "General Zod | Discord: bilaaaaaaaaaal"
description "Pet script for Metropolis"

ui_page {
    "ui/main.html"
}

files {
    "ui/assets/discord_logo.png",
    "ui/assets/exit_logo.png",
    "ui/assets/paw_logo.gif",
    "ui/main.html",
    "ui/main.js",
    "ui/main.css"
}

client_scripts {
    "locales/locales.lua",
    "client/cl_uiFn.lua",
    "client/cl_main.lua",
    "AddOn/KRPPets/locales/locales.lua",
    "AddOn/KRPPets/KRPPets.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "AddOn/KRPPets/locales/locales.lua",
    "AddOn/KRPPets/SKRPPets.lua"
}

shared_scripts {
    "@ZODWorks/shared/ZODWorks.lua",
}
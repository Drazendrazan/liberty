fx_version 'cerulean'
game 'gta5'

description 'QB-Garages'
version '1.0.0'
author 'JDev'

shared_scripts {
    'config.lua',
    '@lc-core/shared/locale.lua',
    'locales/en.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
    'client/police.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

lua54 'yes'
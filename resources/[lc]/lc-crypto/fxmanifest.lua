fx_version 'cerulean'
game 'gta5'

description 'QB-Crypto'
version '1.0.0'

shared_scripts {
    '@lc-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
client_script 'client/main.lua'

dependency 'm-hacking'

lua54 'yes'
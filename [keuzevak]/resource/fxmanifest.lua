fx_version 'cerulean'
game 'gta5'

description 'Mijn eerste resource'
version '0.0.1'

studentinfo {
    'Wiktoria Cybul - 0992258 - INF2C (voor de herkansing: INF1H)'
}

lua54 'yes'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    'client/*.lua'
}

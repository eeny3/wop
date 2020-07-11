Class = require 'lib/class'
Timer = require 'lib/knife.timer'
nata = require 'lib/nata'
push = require 'lib/push'
gamera = require 'lib/gamera'

require 'src/Mob'
require 'src/BossOne'
require 'src/BossTwo'
require 'src/BossFinal'
require 'src/Util'
require 'src/walls'
require 'src/Animation'
require 'src/states/PlayState'
require 'src/states/StartState'
require 'src/states/BaseState'
require 'src/states/VictoryState'
require 'src/StateMachine'

gTextures = {
    ['mobs'] = love.graphics.newImage('graphics/mobs.png'),
    ['assets'] = love.graphics.newImage('graphics/assets.png'),
    ['tileset'] = love.graphics.newImage('graphics/tileset.png')
}

gTextures['mobs']:setFilter('nearest', 'nearest')
gTextures['assets']:setFilter('nearest', 'nearest')
gTextures['tileset']:setFilter('nearest', 'nearest')

gFrames = {
    ['mobs'] = GenerateQuads(gTextures['mobs'], 32, 32),
    ['assets'] = GenerateQuads(gTextures['assets'], 16, 16),
    ['tileset'] = GenerateQuads(gTextures['tileset'], 16, 16),
    ['tilesetBoss'] = GenerateQuads(gTextures['tileset'], 16, 32)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['title'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf', 32)
}

gSounds = {
    ['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
    ['boss'] = love.audio.newSource('sounds/boss.mp3', 'static'),
    --['fire'] = love.audio.newSource('sounds/fire.wav', 'static'),
    --['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static')
}
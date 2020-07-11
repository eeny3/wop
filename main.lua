require 'src/Dependencies'
sti = require "sti"
windfield = require("lib/packages/windfield")
world = windfield.newWorld()

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 576
VIRTUAL_HEIGHT = 324

count, count2 = 0, 0

function love.load()
	math.randomseed(os.time())
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.graphics.setFont(gFonts['medium'])
	love.window.setTitle('WicardOfPAKAK')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    idle = Animation {
        frames = {125,126,127,128},
        interval = 0.2
    }

    cam = gamera.new(0,0,1440,1440)
    cam:setWindow(0,0, 576, 324)

	gStateMachine = StateMachine {
	['play'] = function() return PlayState() end,
    ['start'] = function() return StartState() end,
    ['victory'] = function() return VictoryState() end
	}

    world:addCollisionClass("wall")
    world:addCollisionClass("fireball")
    world:addCollisionClass("loot")
    world:addCollisionClass("player", {ignores = {"fireball"}})
    world:addCollisionClass("mob", {ignores = {"fireball"}})
    world:addCollisionClass("knife", {ignores = {"mob", "fireball"}})
    world:addCollisionClass("rock", {ignores = {"mob", "fireball"}})
    world:addCollisionClass("water", {ignores = {"mob", "fireball", "rock"}})
    world:addCollisionClass("fire", {ignores = {"mob", "fireball", "rock", "water"}})
    world:addCollisionClass("air", {ignores = {"mob", "fireball", "rock", "water", "fire"}})
    require 'src/player'	
--[[
	world:addCollisionClass('Fireball')
    world:addCollisionClass('Player', {ignores = {"fireball"}})
	world:addCollisionClass('Mob')
    world:addCollisionClass('Wall')
    world:addCollisionClass('Box')
--]]
    --gMap = loadTiledMap('map')
    --map = sti("map.lua")
    loadWalls()
    world:setQueryDebugDrawing(true)

	gStateMachine:change('start')

	love.keyboard.keysPressed = {}
end

function love.resize(w,h)
	push:resize(w, h)
end

function love.keypressed(key)
	if key == 'escape' then
        love.event.quit()
    end
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
	gStateMachine:update(dt)
	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()
    gStateMachine:render()
    push:finish()
end

VictoryState = Class{__includes = BaseState}

function VictoryState:init()
    self.map = sti("victoryMap.lua")
    cam:setPosition(0, 0)
end

function VictoryState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        love.event.quit()
    end
    self.map:update(dt)
end

function VictoryState:render() 
    cam:draw(function(l,t,w,h)
    self.map:draw(188, - t)
    end)
    love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('VICTORY', 1, VIRTUAL_HEIGHT / 2 - 40 + 1 + 32, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('VICTORY', 0, VIRTUAL_HEIGHT / 2 - 40 + 32, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('Press Enter', 1, VIRTUAL_HEIGHT / 2 + 17 + 32, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 16 + 32, VIRTUAL_WIDTH, 'center')
end

function VictoryState:enter()
end

function VictoryState:exit()
end
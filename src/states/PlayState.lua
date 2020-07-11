PlayState = Class{__includes = BaseState}

mobs = {}
loot = false

function PlayState:enter()
    monster = Mob(465, 1180, 16, 16, {184, 185, 186, 187}, 2)
    for i = 1, 7 do
        local monster1 = Mob((i-1)*80 + 350, 836, 16, 16, {504, 505, 506, 507}, 3)
        local monster2 = Mob((i-1)*80 + 350, 836 + 48, 16, 16, {632, 633, 634, 635}, 2)
        local monster3 = Mob((i-1)*80 + 350, 836 - 48, 16, 16, {120, 121, 122, 123}, 2)
        local monster4 = Mob((i-1)*80 + 350, 836 - 48 - 48, 16, 16, {568, 569, 570, 571}, 1)
        table.insert(mobs, monster1)
        table.insert(mobs, monster2)
        table.insert(mobs, monster3)
        table.insert(mobs, monster4)
    end

    boss1 = BossOne(870, 408, 16, 25, {1, 2, 3, 4}, 50)
    boss2 = BossTwo(1185, 1200, 32, 32, {73, 74, 75, 76}, 50)
    fBoss1 = BossFinal(435 - 3, 85 - 12, 16, 25, {169, 170, 171, 172}, 250, "rock", 0)
    fBoss2 = BossFinal(435 - 3, 200 - 12, 16, 25, {169, 170, 171, 172}, 250, "water", -1.5)
    fBoss3 = BossFinal(600 - 7, 85 - 12, 16, 25, {137, 138, 139, 140}, 250, "fire", -1.9)
    fBoss4 = BossFinal(600 - 7, 200 - 12, 16, 25, {137, 138, 139, 140}, 250, "air", -1.1)
end

function PlayState:update(dt)
	map:update(dt)
	idle:update(dt)
	playerClass:update(dt)
    
    if monster.health > 0 then
        monster:update(dt)
    end
    for k, v in pairs(mobs) do
        if v.health > 0 then
            v:update(dt)
        end
    end

    if player:getX() >= 745 and player:getX() <= 1000 and player:getY() <= 550 then
        boss1.state = 'attack'
    end

    if boss1.health > 0 and boss1.state == 'attack' then 
        boss1:update(dt)
    end

    if player:getX() >= 1080 and player:getX() <= 1285 and player:getY() >= 1085 then
        boss2.state = 'attack'
    end

    if boss2.health > 0 and boss2.state == 'attack' then
        boss2:update(dt)
    end

    if player:getY() <= 230 then
        gSounds['music']:stop()
        gSounds['boss']:setLooping(true)
        gSounds['boss']:play()
        fBoss1.state = 'attack'
        fBoss2.state = 'attack'
        fBoss3.state = 'attack'
        fBoss4.state = 'attack'
    end
    if fBoss1.health > 0 and fBoss1.state == 'attack' then
        fBoss1:update(dt)
    end
    if fBoss2.health > 0 and fBoss2.state == 'attack' then
        fBoss2:update(dt)
    end
    if fBoss3.health > 0 and fBoss2.state == 'attack' then
        fBoss3:update(dt)
    end
    if fBoss4.health > 0 and fBoss4.state == 'attack' then
        fBoss4:update(dt)
    end
    if boss1.health == 0 then
        if boss2.health == 0 then
            while count < 1 do
                posoh1 = world:newRectangleCollider(boss1.x, boss1.y, 16, 16)
                posoh1:setCollisionClass("loot")
                posoh1:setType('static')
                loot = true
                count = count + 1
            end
        end
    end
    if boss2.health == 0 then
        if boss1.health == 0 then
            while count2 < 1 do 
                posoh2 = world:newRectangleCollider(boss2.x, boss2.y, 16, 16)
                posoh2:setCollisionClass("loot")
                posoh1:setType('static')
                count2 = count2 + 1
            end
        end
    end

    if player:getY() <= 75 and fBoss1.dead and fBoss2.dead and fBoss3.dead and fBoss4.dead then
        gSounds['boss']:stop()
        gSounds['music']:setLooping(true)
        gSounds['music']:play()
        gStateMachine:change('victory') 
    end

	world:update(dt)
    Timer.update(dt)
end

function PlayState:render()
	cam:draw(function(l,t,w,h)
    map:draw(-l, -t)
    playerClass:draw()
    if monster.health > 0 then
        monster:render()
    end
    for k, v in pairs(mobs) do
        if v.health > 0 then
            v:render()
        end
    end
    if boss1.health > 0 then
        boss1:render()
    end
    if boss2.health > 0 then
        boss2:render()
    end
    if fBoss1.health > 0 then
        fBoss1:render()
    end
    if fBoss2.health > 0 then
        fBoss2:render()
    end
    if fBoss3.health > 0 then
        fBoss3:render()
    end
    if fBoss4.health > 0 then
        fBoss4:render()
    end
    if loot then
        love.graphics.draw(gTextures['tileset'], gFrames['tileset'][468], math.floor(posoh1:getX() - 8), math.floor(posoh1:getY() - 8))
        love.graphics.draw(gTextures['tileset'], gFrames['tileset'][468], math.floor(posoh2:getX() - 8), math.floor(posoh2:getY() - 8))
    end
    love.graphics.setLineWidth(1)
    --world:draw()
    end)    

    love.graphics.draw(gTextures['tileset'], gFrames['tileset'][531], 5, 5)
    love.graphics.draw(gTextures['tileset'], gFrames['tileset'][51], 5, 20)
    love.graphics.print(playerClass.health, 22,5)
    love.graphics.print(playerClass.damage, 22,20) 
end

function PlayState:exit()
end
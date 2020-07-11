playerClass = {}
playerClass.width = 32 
playerClass.height = 32 
playerClass.isMoving = false
playerClass.health = 12
playerClass.damage = 1
playerClass.frozen = false
playerClass.frozenTimer = 0
player = world:newCircleCollider(465, 1320, 6)

player:setCollisionClass("player")

fireballs = {}
fireballsVec = {}
cameraScroll = 0

function playerClass:update(dt)
    local vectorX = 0
    local vectorY = 0

    if playerClass.frozenTimer > 1.4 then
        playerClass.frozen = false
        playerClass.frozenTimer = 0
    end

    if playerClass.frozen then
        playerClass.frozenTimer = playerClass.frozenTimer + dt
    else
        if love.keyboard.isDown("a") then
            vectorX = -1
        end
        if love.keyboard.isDown("d") then
            vectorX = 1
        end
        if love.keyboard.isDown("w") then
            vectorY = -1
        end
        if love.keyboard.isDown("s") then
            vectorY = 1
        end

        player:setLinearVelocity(vectorX * 60, vectorY * 60)

        if vectorX == 0 and vectorY == 0 then
            playerClass.isMoving = false
        else
            playerClass.isMoving =  true
        end
    end

    if love.keyboard.wasPressed('q') then
        mX, mY = love.mouse.getPosition()
        mX, mY = push:toGame(mX, mY)
        mX, mY = cam:toWorld(mX,mY)
        local fireball = world:newCircleCollider(player:getX(), player:getY(), 6)
        fireball:setCollisionClass("fireball")
        table.insert(fireballs, fireball)
        table.insert(fireballsVec, {mX - player:getX(), mY - player:getY()})
    end

    for i = 1, #fireballs do
        fVecX = fireballsVec[i][1]
        fVecY = fireballsVec[i][2]
        fireballs[i]:setLinearVelocity(fVecX, fVecY)
    end

    for k, v in pairs(fireballs) do
        if v:enter("wall") or v:enter("mob") then
            v:destroy()
            table.remove(fireballs, k)
            table.remove(fireballsVec, k)
        end
    end

    if player:enter("mob") then
        local collision_data = player:getEnterCollisionData("mob")
        playerClass.health = playerClass.health - 1
        player:applyLinearImpulse( (player:getX() - collision_data.collider:getX()) *10, (player:getY() - collision_data.collider:getY())*10)
    end

    if player:enter("rock") then
        local collision_data = player:getEnterCollisionData("rock")
        playerClass.health = playerClass.health - 12
        player:applyLinearImpulse( (player:getX() - collision_data.collider:getX()) *3, (player:getY() - collision_data.collider:getY())*3)
    end

    if player:enter("water") then
        playerClass.frozen = true
        playerClass.health = playerClass.health - 12
        player:setLinearVelocity(0, 0)
    end

    if player:enter("fire") then
        playerClass.health = playerClass.health - 12
    end

    if player:enter("air") then
        local collision_data = player:getEnterCollisionData("air")
        playerClass.health = playerClass.health - 12
        player:applyLinearImpulse( (collision_data.collider:getX() - player:getX()) *3, (collision_data.collider:getY()- player:getY())*3)
    end

    if playerClass.health <= 0 then
        gSounds['boss']:stop()
        gSounds['music']:setLooping(true)
        gSounds['music']:play()
        player:setX(465)
        player:setY(1320)
        player:setLinearVelocity(0, 0)
        fBoss1.state = 'guard'
        fBoss2.state = 'guard'
        fBoss3.state = 'guard'
        fBoss4.state = 'guard'
        boss1.state = 'guard'
        boss2.state = 'guard'
        playerClass.health = 15
    end

    if player:enter("loot") then
        local collision_data = player:getEnterCollisionData("loot")
        loot = false
        collision_data.collider:destroy()
        playerClass.health = 120
        playerClass.damage = 10
    end

    cam:setPosition(player:getX(), player:getY())
end

function playerClass:draw()
    local px = player:getX()
    local py = player:getY()

    for i = 1, #fireballs do
        love.graphics.draw(gTextures['assets'], gFrames['assets'][211], math.floor(fireballs[i]:getX()) - 8, math.floor(fireballs[i]:getY()) - 8)
    end

    love.graphics.draw(gTextures['mobs'], gFrames['mobs'][idle:getCurrentFrame()], math.floor(px) - 16, math.floor(py) - 25)
end
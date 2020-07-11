BossOne = Class{}

function BossOne:init(x, y, w, h, animFrames, health)
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.animFrames = animFrames
	self.anim = Animation {
    	frames = animFrames,
    	interval = 0.2
	}	
	self.health = health
	self.collider = world:newRectangleCollider(self.x, self.y, self.w, self.h)
	self.collider:setCollisionClass("mob")
	self.collider:setType('static')
	self.collider:setObject(self)
	self.state = 'guard'
	self.veloc = 0
	self.timer = 0
	self.knifes = {}
	self.knifeVec = {}
	self.summonTimer = 4
end

function BossOne:update(dt)
	self.x = self.collider:getX()
	self.y = self.collider:getY()
	if self.collider:enter("fireball") and self.state == 'attack' then
		self.health = self.health - 1
	end

	if self.health == 0 then
		self.collider:setLinearVelocity(0,0)
		self.collider:destroy()
	else
		self.timer = self.timer + dt
		self.summonTimer = self.summonTimer + dt
		if self.timer > 2 then
	        local knife = world:newCircleCollider(self.x, self.y, 6)
	        knife:setCollisionClass("knife")
	        table.insert(self.knifes, knife)
	        table.insert(self.knifeVec, {player:getX() - self.x, player:getY() - self.y})
	    	self.timer = 0
	    end

		for i = 1, #self.knifes do
		    local fVecX = self.knifeVec[i][1]
		    local fVecY = self.knifeVec[i][2]
		    self.knifes[i]:setLinearVelocity(fVecX*2.5, fVecY*2.5)
		end

		for k, v in pairs(self.knifes) do
		    if v:enter("wall") or v:enter("player") then
		        v:destroy()
		        table.remove(self.knifes, k)
		        table.remove(self.knifeVec, k)
		    end
		end

		if self.summonTimer > 5 then
			local monster1 = Mob(850, 450, 16, 16, {376, 377, 378, 379}, 2)
	        local monster2 = Mob(880, 450, 16, 16, {440, 441, 442, 443}, 2)
	        local monster3 = Mob(920, 450, 16, 16, {504, 505, 506, 507}, 2)
	        table.insert(mobs, monster1)
	        table.insert(mobs, monster2)
	        table.insert(mobs, monster3)
	        self.summonTimer = 0
		end
		self.anim:update(dt)
	end
end

function BossOne:render()
	love.graphics.draw(gTextures['mobs'], gFrames['mobs'][self.anim:getCurrentFrame()], math.floor(self.x - 16), math.floor(self.y - 25))

	for i = 1, #self.knifes do
        love.graphics.draw(gTextures['tileset'], gFrames['tileset'][51], math.floor(self.knifes[i]:getX() - 6), math.floor(self.knifes[i]:getY() - 6))
    end
end
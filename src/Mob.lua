Mob = Class{}

function Mob:init(x, y, w, h, animFrames, health)
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
	self.collider:setObject(self)
	self.state = 'guard'
	self.vectorX = 0
	self.vectorY = 0
	self.veloc = 0
	self.timer = 0
end

function Mob:update(dt)
	self.x = self.collider:getX()
	self.y = self.collider:getY()
	if self.collider:enter("fireball") then
		self.health = self.health - playerClass.damage
	end

	if self.health == 0 then
		self.collider:destroy()
	else

		self.timer = self.timer + dt
	    if self.state == 'guard' then
	        if self.timer > math.random(2, 4) then
	            self.vectorX = math.random(-1, 1)
	            self.vectorY = math.random(-1, 1)
	            self.veloc = math.random(40, 60)
	            self.timer = 0
	        end
	    end

    	self.collider:setLinearVelocity(self.vectorX * self.veloc, self.vectorY * self.veloc)

    	local mobColls = world:queryCircleArea(player:getX(), player:getY(), 90, {"mob"})

    	for _, collider in ipairs(mobColls) do 
            if self.collider == collider then
                self.state = 'chase'
            end
        end

        if self.state == 'chase' then
            self.vectorX = player:getX() - self.collider:getX()
            self.vectorY =  player:getY() - self.collider:getY()
            self.veloc = 2
        end

		self.anim:update(dt)
	end
end

function Mob:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tileset'][self.anim:getCurrentFrame()], math.floor(self.x - 8), math.floor(self.y - 8))
end
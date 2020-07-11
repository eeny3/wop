BossTwo = Class{}

function BossTwo:init(x, y, w, h, animFrames, health)
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
	self.veloc = 0
	self.timer = 2
	self.knifes = {}
	self.knifeVec = {}
end

function BossTwo:update(dt)
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
		if self.timer > 4 then
			self.collider:setLinearVelocity((player:getX() - self.x)*2, (player:getY() - self.y)*2)
			self.timer = 0
		end

		if self.collider:enter("wall") or self.collider:enter("player") then
			self.collider:setLinearVelocity(0, 0) 
		end

		self.anim:update(dt)
	end
end

function BossTwo:render()
	love.graphics.draw(gTextures['mobs'], gFrames['mobs'][self.anim:getCurrentFrame()], math.floor(self.x - 16), math.floor(self.y - 16))
end
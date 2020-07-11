BossFinal = Class{}

function BossFinal:init(x, y, w, h, animFrames, health, spellType, timer)
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
	self.collider:setType('static')
	self.state = 'guard'
	self.vectorX = 0
	self.vectorY = 0
	self.veloc = 0
	self.timer = timer
	self.spellType = spellType
	self.fireSpells = {}
	self.waterSpells = {}
	self.airSpells = {}
	self.rockSpells = {}
	self.spellVec = {}
	self.spells = {}
	self.frame = 0
	self.dead = false
	if spellType == 'rock' then
		self.frame = 209
	elseif spellType == 'water' then
		self.frame = 210
	elseif spellType == 'fire' then
		self.frame = 211
	else
		self.frame = 212
	end
end

function BossFinal:update(dt)
self.x = self.collider:getX()
	self.y = self.collider:getY()
	if self.collider:enter("fireball") then
		self.health = self.health - playerClass.damage
	end

	if self.health == 0 then
		self.dead = true
		self.collider:destroy()
	else
		self.timer = self.timer + dt
		if self.timer > math.random(2,6) then
	        local spell = world:newCircleCollider(self.x, self.y, 6)
	        spell:setCollisionClass(self.spellType)
	        table.insert(self.spells, spell)
	        table.insert(self.spellVec, {player:getX() - self.x, player:getY() - self.y})
	    	self.timer = 0
	    end

		for i = 1, #self.spells do
		    local fVecX = self.spellVec[i][1]
		    local fVecY = self.spellVec[i][2]
		    self.spells[i]:setLinearVelocity(fVecX, fVecY)
		end

		for k, v in pairs(self.spells) do
		    if v:enter("wall") or v:enter("player") then
		        v:destroy()
		        table.remove(self.spells, k)
		        table.remove(self.spellVec, k)
		    end
		end

		self.anim:update(dt)
	end
end

function BossFinal:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tilesetBoss'][self.anim:getCurrentFrame()], math.floor(self.x - 8), math.floor(self.y - 25))

	for i = 1, #self.spells do
        love.graphics.draw(gTextures['assets'], gFrames['assets'][self.frame], math.floor(self.spells[i]:getX() - 8), math.floor(self.spells[i]:getY() - 8))
    end
end
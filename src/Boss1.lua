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
	self.collider:setType('static')
	self.collider:setObject(self)
	self.state = 'guard'
	self.veloc = 0
	self.timer = 0
end

function Mob:update(dt)

end

function Mob:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tileset'][self.anim:getCurrentFrame()], math.floor(self.x - 8), math.floor(self.y - 8))
end
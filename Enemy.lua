local sprite = love.graphics.newImage("assets/sprites/player/mule.png")

function Enemy()
	local enm = {}
	
	enm.x = love.math.random(sprite:getWidth(), lg.getWidth()-sprite:getWidth())
	enm.y = love.math.random(sprite:getHeight(), lg.getHeight()-sprite:getHeight())
	enm.targetX = enm.x
	enm.targetY = enm.y
	
	enm.speed = 16 + love.math.random(-3, 3)
	
	function enm:draw()
		lg.draw(sprite, self.x, self.y, 0, 1, 1, sprite:getWidth()/2, sprite:getHeight()/2)
	end

	function enm:update(dt)
		if self.x < self.targetX then
			self.x = self.x + self.speed * dt
		elseif self.x > self.targetX then
			self.x = self.x - self.speed * dt
		end
		
		if self.y < self.targetY then
			self.y = self.y + self.speed * dt
		elseif self.y > self.targetY then
			self.y = self.y - self.speed * dt
		end
	end
	
	function enm:target(x, y)
		self.targetX = x
		self.targetY = y
	end
	
	return enm
end
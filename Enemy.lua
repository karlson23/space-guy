local sprite = love.graphics.newImage("assets/sprites/enemy/enemy.png")

function Enemy()
	local enm = {}
	
	enm.x = love.math.random(sprite:getWidth(), lg.getWidth()-sprite:getWidth())
	enm.y = love.math.random(sprite:getHeight(), lg.getHeight()-sprite:getHeight())
	enm.targetX = enm.x
	enm.targetY = enm.y
	
	enm.speed = 16 + love.math.random(-3, 3)
	enm.health = 100
	
	function enm:draw()
		lg.draw(sprite, self.x, self.y)
		
		lg.setColor(1, 0, 0)
		lg.line(self.x, self.y-1, self.x+(self.health/100*sprite:getWidth()), self.y-1)
	end

	function enm:update(dt)
		local a = -math.atan2(self.targetY - self.y, self.targetX - self.x)
		self.x = self.x + math.cos(a) * self.speed * dt
		self.y = self.y - math.sin(a) * self.speed * dt
	end
	
	function enm:target(x, y)
		self.targetX = x
		self.targetY = y
	end
	
	function enm:isDead()
		return self.health <= 0
	end
	
	function enm:takeDamage(amount)
		self.health = self.health - amount or 10
	end
	
	return enm
end
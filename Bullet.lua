local sprite = love.graphics.newImage("assets/sprites/player/bullet.png")

function Bullet(x, y, angle)
	local blt = {}
	
	blt.x = x
	blt.y = y
	blt.ang = angle
	
	blt.speed = 64 + love.math.random(-3, 3)
	blt.damage = 50
	
	function blt:draw()
		lg.draw(sprite, self.x, self.y, (math.pi-self.ang), 1, 1, sprite:getWidth()/2, sprite:getHeight()/2)
	end

	function blt:update(dt)
		self.x, self.y = self.x + math.cos(self.ang) * self.speed * dt, self.y - math.sin(self.ang) * self.speed * dt
	end
	
	return blt
end
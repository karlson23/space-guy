require "Bullet"

local function filter(item)
	return item ~= player
end

function BulletArr()
	bulletArr = {}
	
	bulletArr.bullets = {}
	
	function bulletArr:draw()
		for _, v in ipairs(self.bullets) do
			v:draw()
		end
	end
	
	function bulletArr:update(dt)
		for i = #self.bullets, 1, -1 do
			local b = self.bullets[i]
			
			b:update(dt)
			local hits, len = World:queryPoint(b.x, b.y, filter)
			for i = #hits, 1, -1 do
				hits[i]:takeDamage(b.damage)
			end
			World.freeTable(hits)
			
			local outOfView = b.x < -32 or b.y < -32 or b.x > lg.getWidth() or b.y > lg.getHeight()
			if len > 0 or outOfView then
				table.remove(self.bullets, i)
			end
		end
	end
	
	function bulletArr:shoot(x, y, ang)
		table.insert(self.bullets, Bullet(x, y, ang))
	end 
end

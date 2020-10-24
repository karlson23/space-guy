require "Enemy"
local rand = love.math.random

function Spawner()
	spawner = {}
	
	spawner.enemies = {} --All the enemies
	spawner.o2s = {} --All the oxygen cylinders
	
	function spawner:draw()
		for _, v in ipairs(self.enemies) do
			v:draw()
		end
		for _, v in ipairs(self.o2s) do
			v:draw()
		end
	end
	
	function spawner:update(dt)
		for _, v in ipairs(self.enemies) do
			v:update(dt)
		end
		for _, v in ipairs(self.o2s) do
			v:update(dt)
		end
		
		local t = math.abs(math.sin(love.timer.getTime()))
		
		if t > .9 then
			table.insert(self.enemies, Enemy())
		end
	end
	
	function spawner:target(x, y)
		for _, v in ipairs(self.enemies) do
			v:target(x, y)
		end
	end 
end
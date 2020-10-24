lg = love.graphics
require "player"
require "Spawner"


function love.load()
	Spawner()
	love.keyboard.setTextInput(true)
end


function love.keypressed(key)
	if key == "space" then
		player.vel = 190
		player.timer = player.timer + 1 
	else player.vel = 50
   end
end

function love.update(dt)
	playermovement(dt)
	driftTimer(dt)
	
	spawner:update(dt)
	spawner:target(love.mouse.getPosition())
end

function love.draw()
	lg.setBackgroundColor(1, 1, 1)
	lg.setColor(1, 1, 1)
	lg.draw(player.main, player.x,player.y)

    lg.setColor(0,0,0)
	lg.print(player.timer,0,0)
	
	spawner:draw()
end

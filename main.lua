require "common.Class"
require "player"
require "Spawner"
lg = love.graphics



function love.load()
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
	Spawner()
end

function love.draw()
	lg.setBackgroundColor(255,255,255)
	lg.draw(player.main, player.x,player.y)

    lg.setColor(0,0,0)
	lg.print(player.timer,0,0)
end
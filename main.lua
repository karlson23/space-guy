lg = love.graphics

World = require("bump-niji").newWorld()

require "player"
require "BulletArray"
require "Spawner"

local scope

function love.load()
	Spawner()
	BulletArr()
	
	scope = lg.newImage("assets/sprites/player/scope.png")
	
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
	bulletArr:update(dt)
	spawner:update(dt)
	spawner:target(player.x, player.y)
end

function love.draw()
	lg.setBackgroundColor(1, 1, 1)
	lg.setColor(1, 1, 1)
	lg.draw(player.main, player.x,player.y)

    lg.setColor(1, 1, 1)
	spawner:draw()
	
	lg.setColor(1, 1, 1)
	bulletArr:draw()
	
	lg.setColor(1, 1, 1)
	lg.draw(scope, love.mouse.getX(), love.mouse.getY())
end

function love.mousepressed(x, y)
	bulletArr:shoot(player.x, player.y, -math.atan2(y-player.y, x-player.x))
end

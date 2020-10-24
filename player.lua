player = {}
player.main = love.graphics.newImage("assets/sprites/player/main.png")
player.image = love.graphics.newImage("assets/sprites/player/main.png")
player.mule = love.graphics.newImage("assets/sprites/player/mule.png")
player.right  = love.graphics.newImage("assets/sprites/player/right.png")
player.left = love.graphics.newImage("assets/sprites/player/left.png")
player.x = 64
player.y = 64
player.vel = 50
player.width = 10
player.height = 10
player.timer = 0

function playermovement(dt)
	local mx, my = 0, 0
	
	if love.keyboard.isDown("d") then
		mx = player.vel * dt
		player.main = player.right 
	end
    if love.keyboard.isDown("a") then
    	mx = -player.vel * dt
    	player.main = player.left 
	end  
    if love.keyboard.isDown("w") then
    	my = -player.vel * dt
	end
	if love.keyboard.isDown("s") then
		my = player.vel * dt
	end
	
	player.x, player.y = World:move(player, player.x + mx, player.y + my)
end


World:add(player, player.x, player.y, player.width, player.height)
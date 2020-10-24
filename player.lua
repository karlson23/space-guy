player = {}
player.main = love.graphics.newImage("assets/sprites/player/main.png")
player.image = love.graphics.newImage("assets/sprites/player/main.png")
player.mule = love.graphics.newImage("assets/sprites/player/mule.png")
player.right  = love.graphics.newImage("assets/sprites/player/right.png")
player.left = love.graphics.newImage("assets/sprites/player/left.png")
player.x = 0
player.y = 0
player.vel = 50
player.width = 10
player.height = 10
player.timer = 0



function playermovement(dt)
		if love.keyboard.isDown("d") then
		player.x = player.x + player.vel * dt
		player.main = player.right 
end
    if love.keyboard.isDown("a") then
    	player.x = player.x - player.vel * dt
    	player.main = player.left 
end     
    if love.keyboard.isDown("w") then
    	player.y = player.y - player.vel * dt
end
    if love.keyboard.isDown("s") then
    	player.y = player.y + player.vel * dt
   end 	
end
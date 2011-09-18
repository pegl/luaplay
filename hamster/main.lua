-- Tutorial 1: Hamster Ball
-- Add an image to the game and move it around using 
-- the arrow keys.
-- compatible with löve 0.6.0 and up

function love.load()
   hamster = love.graphics.newImage("hamster.png")
   x = 50
   y = 50
   speed = 100
end

function love.update(dt)
   if love.keyboard.isDown("right") then
      x = x + (speed * dt)
   elseif love.keyboard.isDown("left") then
      x = x - (speed * dt)
   end

   if love.keyboard.isDown("down") then
      y = y + (speed * dt)
   elseif love.keyboard.isDown("up") then
      y = y - (speed * dt)
   end
end

function love.draw()
   love.graphics.draw(hamster, x, y)
end

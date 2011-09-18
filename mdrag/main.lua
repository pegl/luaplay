function love.load()
  rect = {
    x = 100,
    y = 100,
    width = 100,
    height = 100,
    dragging = { active = false, diffX = 0, diffY = 0 }
  }
end

function love.draw()
	love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
end

function love.mousepressed(x, y, button)
	if button == "l"
	and x > rect.x and x < rect.x + rect.width
	and y > rect.y and y < rect.y + rect.height
	then
		rect.dragging.active = true
		rect.dragging.diffX = x - rect.x
		rect.dragging.diffY = y - rect.y
	end
end

function love.update(dt)
	if rect.dragging.active then
		rect.x = love.mouse.getX() - rect.dragging.diffX
		rect.y = love.mouse.getY() - rect.dragging.diffY
	end
end

function love.mousereleased(x, y, button)
	if button == "l" then rect.dragging.active = false end
end


function love.load()
	grass = love.graphics.newImage("sgreen.png")
	dirt = love.graphics.newImage("sorange.png")

	block_width = grass:getWidth()
	block_height = grass:getHeight()
	block_depth = block_height / 2

	print("block_width"..block_width)

	grid_size = 32
	grid = {}

	for x = 1, grid_size do
		grid[x] = {}
		for y = 1, grid_size do
			grid[x][y] = 1
		end
	end

	grid[2][4] = 2
	grid[6][5] = 2
end

function love.draw()
	grid_x = love.graphics.getWidth() / 2
	grid_y = love.graphics.getHeight() / 2

	for x = 1,grid_size do
		for y = 1,grid_size do
			if grid[x][y] == 1 then
				love.graphics.draw(grass,
				grid_x + ((y-x) * (block_width / 2)),
				grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size / 2)))
			else -- grid[x][y] == 2
				love.graphics.draw(dirt,
				grid_x + ((y-x) * (block_width / 2)),
				grid_y + ((x+y) * (block_depth / 2)) - (block_depth * (grid_size / 2)))
			end
		end
	end

end

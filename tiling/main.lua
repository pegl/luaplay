local text
local tile = {}

width = 640
height = 480

-- map variables
map_w = 20
map_h = 20
map_x = 0
map_y = 0
map_offset_x = 30
map_offset_y = 30
map_display_w = 14
map_display_h = 10
tile_w = 32
tile_h = 32

function love.load()
	love.graphics.setMode( width, height, true)
	image = love.graphics.newImage("cake.jpg")
	local f = love.graphics.newFont(12)
	love.graphics.setFont(f)
	--love.graphics.setColor(255,255,255,255)
	love.graphics.setBackgroundColor(255,255,255)

	--music = love.audio.newSource("3AM.ogg")
	--love.audio.play(music)

	text = "Nothing yet"

-- our tiles
   for i=0,3 do -- change 3 to the number of tile images minus 1.
      tile[i] = love.graphics.newImage( "tile"..i..".png" )
   end
   
   love.graphics.setFont(12)
   
end

map={
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 0, 2, 2, 2, 0, 3, 0, 3, 0, 1, 1, 1, 0, 0, 0, 0, 0},
   { 0, 1, 0, 0, 2, 0, 2, 0, 3, 0, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 1, 0, 2, 2, 2, 0, 0, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 0, 0, 0, 3, 0, 3, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0},
   { 0, 2, 2, 2, 0, 3, 3, 3, 0, 1, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

function draw_map()
	for y=1, map_display_h do
		for x=1, map_display_w do
			love.graphics.draw(
			tile[map[y+map_y][x+map_x]],
			(x*tile_w)+map_offset_x,
			(y*tile_h)+map_offset_y )
		end
	end
end

function love.keypressed(key, unicode)
	if key == "return" then
		text = "RETURN has been pressed!"
	end
	if key == "h" then
		if love.mouse.isVisible() then
			love.mouse.setVisible(false)
		else
			love.mouse.setVisible(true)
		end
	end

   if key == 'up' then
      map_y = map_y-1
      if map_y < 0 then map_y = 0; end
   end
   if key == 'down' then
      map_y = map_y+1
      if map_y > map_h-map_display_h then map_y = map_h-map_display_h; end
   end
   
   if key == 'left' then
      map_x = math.max(map_x-1, 0)
   end
   if key == 'right' then
      map_x = math.min(map_x+1, map_w-map_display_w)
   end
end

function love.keyreleased(key, unicode)
	if key == "return" then
		text = "RETURN has been released!"
	end
end

function love.mousepressed(x, y, button)
	if button == "l" then
		text = "Left mouse button has been pressed at X:"..x.." Y: "..y
	end
end

function love.mousereleased(x, y, button)
	if button == "l" then
		text = "Left mouse button released"
	end
end

function love.update()
	if love.keyboard.isDown( " " ) then
		text = "The SPACE key is held down!"
	end
	if love.mouse.isDown("r") then
		text = "Right mouse button pressed"
	end
end

function love.draw()
	love.graphics.print(text, 400, 300)
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, 10, 20 )

	draw_map()
end

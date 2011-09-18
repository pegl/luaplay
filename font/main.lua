function love.load()
	--font = love.graphics.newFont(14) -- the number denotes the font size
	--font = love.graphics.newFont("AwesomeFont.ttf", 15)
	--love.graphics.setFont(filename, size)
	font = love.graphics.newImageFont("imagefont.png",
   		" abcdefghijklmnopqrstuvwxyz" ..
	   	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    	"123456789.,!?-+/():;%&`'*#=[]\"")

	love.graphics.setFont(font)

end

function love.draw()
	love.graphics.print("This is some awesome text", 100, 100)

	num = 15
	love.graphics.print(num, 100, 150)

	love.graphics.print("this is the first line\nthis is the second one.\n and third\n\nfifth", 100, 200)

	love.graphics.printf("a really long sentencw ill porbably be borken into many pieces and spelt terribly due to fast typing and innacuracy thus given", 500, 100, 250, 'right')

	love.graphics.printf("This text will be centered no matter what.\n(and you LOVE it)", 0, 400, 800, 'center')

	love.graphics.printf("Aligned to the left, yes very much so.", 100, 500, 150)
end

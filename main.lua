-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
_W = display.contentWidth;
_H = display.contentHeight;
local physics = require("physics");
physics.start();


local background = display.newImageRect("images/b.jpg",_W,_H+50);
background.x =_W/2
background.y=_H/2
local octo = display.newImageRect("images/octo.png",150,100);
octo.x = _W/2
octo.y = _H - 50





	  



function octo:touch(e)
	if (e.phase == "moved") then
		--45 -266
		
			octo.x = e.x
			
	end
	-- body
end

local tapCount = 0
local size = 150
local tapText = display.newText( tapCount, display.contentCenterX,  display.contentCenterY, native.systemFont, size)



 


local randomBall = function()
	bomb = display.newImageRect( "images/bomb.png",100,100);
	bomb.x = math.random( _W )
	bomb.y = -50
	tapCount = tapCount + 1
	print(bomb.y,' ',bomb.x)
	tapText.score = "hello"
	physics.addBody( bomb, { density=2.9, friction=0.5, bounce=0.7, radius=24 } );
	tapText.text =tapCount
end


timer.performWithDelay( 1000, randomBall, 100000 )



octo:addEventListener("touch",octo)

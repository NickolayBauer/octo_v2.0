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
physics.addBody( octo,"static", { density=2.9, friction=0.5, bounce=0.7, radius=40 } );




	  
local mamont = false


function octo:touch(e)
	if (e.phase == "moved") then
		--45 -266
			if mamont  == false then
			octo.x = e.x
			end
	end
	-- body
end


local size = 150
local tapText = display.newText( 0, display.contentCenterX,  display.contentCenterY, native.systemFont, size)



 


local randomBall = function()
	if mamont  == false then
	bomb = display.newImageRect( "images/bomb.png",100,100);
	bomb.x = math.random( _W )
	bomb.y = -50
	
	tapText.score = "hello"
	physics.addBody( bomb, { density=2.9, friction=0.5, bounce=0.7, radius=24 } );
	tapText.text = tapText.text + 1
	end
end
local someText = ""
local loseText = display.newText(someText, display.contentCenterX,  display.contentCenterY-200, native.systemFont, 60)
loseText:setFillColor(0,0,0)
function octo:collision(e)
	mamont = true
	print(mamont)
	someText = " ☠ ☠ ☠"
	loseText.text = someText

end

function loseText:touch(e)
	if (e.phase == "began") then
		
			mamont = false
			tapText.text = 0
			loseText.text = ''
	end
	-- body
end

timer.performWithDelay( 1000, randomBall, 100000 )


octo:addEventListener('collision',octo)
octo:addEventListener("touch",octo)
loseText:addEventListener('touch',loseText)

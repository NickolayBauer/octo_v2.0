
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require("composer");
local widget = require("widget");

_W = display.contentWidth;
_H = display.contentHeight;

local buttonCalc = widget.newButton {
shape = 'roundedRect',
raidus = 10,
width = _W*0.85,
height = '70',


fillColor = { default={ 255,0, 0 }, over={ 0, 149/255, 59/255 } },
labelColor = { default={ 1 }, over={ 1 } },
fontSize = 32,
label = "Играть",
onPress = function (event)
			
		composer.gotoScene("game");
		

		end
}
buttonCalc.x = _W/2
buttonCalc.y = _H*0.30


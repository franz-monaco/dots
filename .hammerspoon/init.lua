local noescape = require("modules.noescape")
local streamdeck = require("modules.streamdeck")
local moveToScreen = require("modules.moveToScreen")
local moveToWindow = require("modules.moveToWindow")
local expander = require("modules.expander")

-- noescape.setup()
streamdeck.setup()
moveToScreen.setup()
moveToWindow.setup()

-- Configure text expander:
-- local expander = expander.setup()

hs.loadSpoon("Hammerflow")
spoon.Hammerflow.registerFormat({
	atScreenEdge = 2,
	fillColor = { alpha = 0.95, hex = "111111" },
	padding = 18,
	radius = 16,
	strokeColor = { alpha = 1, hex = "666666" },
	textColor = { alpha = 1, hex = "eeeeee" },
	textStyle = {
		paragraphStyle = { lineSpacing = 6 },
		-- shadow = { offset = { h = -1, w = 1 }, blurRadius = 10, color = { alpha = 0.0, white = 0 } },
	},
	strokeWidth = 2,
	textFont = "MesloLGS Nerd Font Mono",
	textWeight = 100,
	textSize = 20,
})

spoon.Hammerflow.loadFirstValidTomlFile({
	"me.toml",
})

hs.loadSpoon("Hammerflow")

local M = {}

function M.setup()
	function moveToWindowWest()
		local win = hs.window.focusedWindow()
		win:focusWindowWest(nil, true)
	end

	function moveToWindowEast()
		local win = hs.window.focusedWindow()
		win:focusWindowEast(nil, true)
	end

	function moveToWindowSouth()
		local win = hs.window.focusedWindow()
		win:focusWindowSouth(nil, true)
	end

	function moveToWindowNorth()
		local win = hs.window.focusedWindow()
		win:focusWindowNorth(nil, true)
	end

	hs.hotkey.bind({ "cmd", "ctrl", "alt" }, "h", moveToWindowEast)
	hs.hotkey.bind({ "cmd", "ctrl", "alt" }, "j", moveToWindowWest)
	hs.hotkey.bind({ "cmd", "ctrl", "alt" }, "k", moveToWindowSouth)
	hs.hotkey.bind({ "cmd", "ctrl", "alt" }, "l", moveToWindowNorth)
end

return M

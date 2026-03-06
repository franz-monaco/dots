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

	hs.hotkey.bind({ "cmd", "shift", "alt" }, "h", moveToWindowWest)
	hs.hotkey.bind({ "cmd", "shift", "alt" }, "j", moveToWindowSouth)
	hs.hotkey.bind({ "cmd", "shift", "alt" }, "k", moveToWindowNorth)
	hs.hotkey.bind({ "cmd", "shift", "alt" }, "l", moveToWindowEast)
end

return M

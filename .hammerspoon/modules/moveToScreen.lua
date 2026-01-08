local M = {}

function M.setup()
	function moveToScreenEast()
		local app = hs.window.focusedWindow()
		app:moveOneScreenEast(false, true, 0.0)
		app:maximize()
	end

	function moveToScreenWest()
		local app = hs.window.focusedWindow()
		app:moveOneScreenWest(false, true, 0.0)
		app:maximize()
	end

	function moveToScreenSouth()
		local app = hs.window.focusedWindow()
		app:moveOneScreenSouth(false, true, 0.0)
		app:maximize()
	end

	function moveToScreenNorth()
		local app = hs.window.focusedWindow()
		app:moveOneScreenNorth(false, true, 0.0)
		app:maximize()
	end

	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, "h", moveToScreenWest)
	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, "j", moveToScreenSouth)
	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, "k", moveToScreenNorth)
	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, "l", moveToScreenEast)
end

return M

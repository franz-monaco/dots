local M = {}

local cb

function M.setup()
	function setButtons(device)
		device:buttonCallback(function(userdata, pressedButtons, state)
			local modifiers = hs.eventtap.checkKeyboardModifiers()
			if modifiers.ctrl then
				if state == true then
					if pressedButtons == 1 then
						hs.application.launchOrFocusByBundleID("com.microsoft.Outlook")
					end
					if pressedButtons == 2 then
						hs.application.launchOrFocusByBundleID("com.microsoft.teams2")
					end
					if pressedButtons == 3 then
						hs.application.launchOrFocusByBundleID("com.microsoft.Excel")
					end
				end
			elseif modifiers.alt then
				if state == true then
					if pressedButtons == 1 then
						hs.application.launchOrFocusByBundleID("com.apple.finder")
					end
					if pressedButtons == 2 then
						hs.application.launchOrFocusByBundleID("com.apple.Notes")
					end
					if pressedButtons == 3 then
						hs.application.launchOrFocusByBundleID("md.obsidian")
					end
				end
			else
				if state == true then
					if pressedButtons == 1 then
						hs.application.launchOrFocusByBundleID("com.mitchellh.ghostty")
					end
					if pressedButtons == 2 then
						hs.application.launchOrFocusByBundleID("com.google.Chrome")
					end
					if pressedButtons == 3 then
						hs.application.launchOrFocusByBundleID("com.apple.Safari")
					end
				end
			end
		end)
	end

	hs.streamdeck.init(function(connected, device)
		cb = setButtons(device)
	end)
end

return M

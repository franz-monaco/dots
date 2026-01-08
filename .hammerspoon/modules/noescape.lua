local M = {}

local function contains(table, val)
	for i = 1, #table do
		if table[i] == val then
			return true
		end
	end
	return false
end

function M.setup()
	hs.eventtap
		.new({ hs.eventtap.event.types.keyDown }, function(event)
			-- Check if the pressed key is ESC
			if event:getKeyCode() == hs.keycodes.map.escape then
				-- Get the active app bundle ID
				local frontApp = hs.application.frontmostApplication()
				local bundleID = frontApp and frontApp:bundleID() or ""

				local bundleIDs = { "com.apple.Safari", "com.google.Chrome" }

				if contains(bundleIDs, bundleID) then
					return true
				end
			end
		end)
		:start()
end

return M

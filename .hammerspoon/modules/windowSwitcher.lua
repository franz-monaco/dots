local M = {}

function M.setup()
	function switchWindow()
		local app = hs.window.focusedWindow():application()
		local windows = app:allWindows()
		if #windows > 1 then
			windows[#windows]:focus()
		end
	end
end

return M

local M = {}

local function split(str, delimiter)
	local returnTable = {}
	for k, v in string.gmatch(str, "([^" .. delimiter .. "]+)") do
		returnTable[#returnTable + 1] = k
	end
	return returnTable
end
function M.setup()
	local keywords = {
		["..name"] = "My address\ntest\ntest",
		["..addr"] = "My address",
	}

	local word = ""
	local keyMap = require("hs.keycodes").map
	local keyWatcher

	keyWatcher = hs.eventtap
		.new({ hs.eventtap.event.types.keyDown }, function(ev)
			local keyCode = ev:getKeyCode()
			local char = ev:getCharacters()

			if keyCode == keyMap["delete"] then
				if #word > 0 then
					-- remove the last char from a string with support to utf8 characters
					local t = {}
					for _, chars in utf8.codes(word) do
						table.insert(t, chars)
					end
					table.remove(t, #t)
					word = utf8.char(table.unpack(t))
					print("Word after deleting:", word)
				end
				return false -- pass the "delete" keystroke on to the application
			end

			-- append char to "word" buffer
			word = word .. char
			print("Word after appending:", word)

			-- if one of these "navigational" keys is pressed
			if
				keyCode == keyMap["return"]
				or keyCode == keyMap["space"]
				or keyCode == keyMap["up"]
				or keyCode == keyMap["down"]
				or keyCode == keyMap["left"]
				or keyCode == keyMap["right"]
			then
				word = "" -- clear the buffer
			end

			print("Word to check if hotstring:", word)

			-- finally, if "word" is a hotstring
			local output = keywords[word]
			if type(output) == "function" then -- expand if function
				local _, o = pcall(output)
				if not _ then
					print("~~ expansion for '" .. what .. "' gave an error of " .. o)
					-- could also set o to nil here so that the expansion doesn't occur below, but I think
					-- seeing the error as the replacement will be a little more obvious that a print to the
					-- console which I may or may not have open at the time...
					-- maybe show an alert with hs.alert instead?
				end
				output = o
			end
			if output then
				for i = 1, utf8.len(word), 1 do
					hs.eventtap.keyStroke({}, "delete", 0)
				end -- delete the abbreviation
				-- hs.eventtap.keyStrokes(output) -- expand the word

				local is_first_line = true
				for _, line in ipairs(split(output, "\n")) do
					if is_first_line then
						is_first_line = false
					else
						hs.eventtap.keyStroke({}, "return")
					end
					hs.eventtap.keyStrokes(line)
				end

				word = "" -- clear the buffer
			end

			return false -- pass the event on to the application
		end)
		:start() -- start the eventtap

	-- return keyWatcher to assign this functionality to the "expander" variable to prevent garbage collection
	return keyWatcher
end

return M

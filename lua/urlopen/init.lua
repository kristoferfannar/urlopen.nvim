local util = require("urlopen.util")
local open = require("urlopen.open")

-- see docs at https://google.com
local function open_url()
	local word = util.get_word_under_cursor()
	if util.is_valid_url(word) then
		print("url: " .. word)
		open.open_browser(word)
	else
		print("invalid url: " .. word)
	end
end

vim.api.nvim_create_user_command("UrlOpen", open_url, {})

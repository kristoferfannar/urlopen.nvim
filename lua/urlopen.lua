print("in init.lua")

local function clean_url(url)
	-- trim enclosing double quotes from url
	-- note that we can't simply use '^"(.-)"$' as that doesn't remove one-sided enclosing quotes
	local trimmed = url:gsub('^"(.*)', "%1"):gsub('(.*)"$', "%1"):gsub("^'(.*)$", "%1"):gsub("(.*)'$", "%1")
	return trimmed
end

local function is_valid_url(url)
	local trimmed = clean_url(url)
	local pattern = '^https?://[%w-_%.%?%.:/%+=&]*[^"]*$'
	return string.match(trimmed, pattern) ~= nil
end

local function get_word_under_cursor()
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1
	local line = vim.api.nvim_get_current_line()

	local left = col
	while left > 0 and not line:sub(left, left):match("%s") do
		left = left - 1
	end
	left = left + 1

	local right = col
	while right <= string.len(line) and not line:sub(right, right):match("%s") do
		right = right + 1
	end

	if left == right then
		return ""
	end

	return line:sub(left, right - 1)
end

local function open_url()
	local word = get_word_under_cursor()
	if is_valid_url(word) then
		print("url: " .. word)
	else
		print('"' .. word .. '" is invalid url')
	end
end

vim.api.nvim_create_user_command("UrlOpen", open_url, {})

local M = {}
M.test = function()
	print("testing...")
end

return M

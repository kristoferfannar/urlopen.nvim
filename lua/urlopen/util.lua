local M = {}

local function clean_url(url)
	-- trim enclosing double quotes from url
	-- note that we can't simply use '^"(.-)"$' as that doesn't remove one-sided enclosing quotes
	local trimmed = url:gsub('^"(.*)', "%1"):gsub('(.*)"$', "%1"):gsub("^'(.*)$", "%1"):gsub("(.*)'$", "%1")
	return trimmed
end

local function is_valid_url(url)
	local pattern = '^https?://[%w-_%.%?%.:/%+=&]*[^"]*$'
	return string.match(url, pattern) ~= nil
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

	return clean_url(line:sub(left, right - 1))
end

M.is_valid_url = is_valid_url
M.get_word_under_cursor = get_word_under_cursor

return M

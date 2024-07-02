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

local urls = {
	"https://google.com",
	'"https://google.com"',
	'"https://google.com',
	'https://google.com"',
	"'https://google.com'",
	"'https://google.com",
	"https://google.com'",
	"test://testing.test",
	"hello",
	"not-a-url",
}

for i = 1, #urls, 1 do
	-- print("url: ", urls[i] .. " - is_valid_url: " .. tostring(is_valid_url(urls[i])))
	local url = urls[i]
	local trimmed = clean_url(url)
	print("    url: " .. url)
	print("trimmed: " .. trimmed)
	print("")
end

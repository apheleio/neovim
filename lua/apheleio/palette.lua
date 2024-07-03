local options = require("apheleio.config").options
local variants = {
	main = {
		_nc = "#fafafa",
		pure = "#fdfdfd", -- base bg
		focus = "#343a40", -- base fg
		clarity = "#a3a3a3", -- alt fg
		harmony = "#1a1d20", -- accent
		bliss = "#868f98", -- strings
		whisper = "#ced4da", -- comments
		whimsy = "#808a93",
		dim = "#c8c8c8",
		calm = "#f3f2f8", -- surface
		serene = "#e5e1ef", -- overlay
		ethereal = "#2f3337",
		highlight_low = "#f5f5f5",
		highlight_med = "#ebebeb",
		highlight_high = "#dbdbdb",
	},
	dark = {
		_nc = "#1a1d20",
		pure = "#343a40",
		focus = "#fdfdfd",
		clarity = "#7a7a7a",
		harmony = "#fafafa",
		bliss = "#acb3b9",
		whisper = "#525252",
		whimsy = "#c2c2c2",
		dim = "#e0e0e0",
		calm = "#ada1ce",
		serene = "#e2ddee",
		ethereal = "#2f3337",
		highlight_low = "#40474f",
		highlight_med = "#4e5760",
		highlight_high = "#5b6671",
	},
}

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "dark" and variants.dark or variants["main"]

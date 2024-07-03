local p = require("apheleio.palette")
local config = require("apheleio.config")

local bg_base = p.pure
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.focus, fg = p.pure, gui = "bold" },
		b = { bg = p.bliss, fg = p.pure },
		c = { bg = bg_base, fg = p.whisper },
	},
	insert = {
		a = { bg = p.harmony, fg = p.pure, gui = "bold" },
		b = { bg = p.bliss, fg = p.pure },
		c = { bg = bg_base, fg = p.whisper },
	},
	visual = {
		a = { bg = p.harmony, fg = p.pure, gui = "bold" },
		b = { bg = p.bliss, fg = p.pure },
		c = { bg = bg_base, fg = p.whisper },
	},
	replace = {
		a = { bg = p.harmony, fg = p.pure, gui = "bold" },
		b = { bg = p.bliss, fg = p.pure },
		c = { bg = bg_base, fg = p.whisper },
	},
	command = {
		a = { bg = p.focus, fg = p.pure, gui = "bold" },
		b = { bg = p.bliss, fg = p.pure },
		c = { bg = bg_base, fg = p.whisper },
	},
	inactive = {
		a = { bg = p.whisper, fg = p.bliss, gui = "bold" },
		b = { bg = bg_base, fg = p.dim },
		c = { bg = bg_base, fg = p.dim },
	},
}

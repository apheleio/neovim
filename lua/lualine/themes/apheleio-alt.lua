local p = require("apheleio.palette")

return {
	normal = {
		a = { bg = p.serene, fg = p.ethereal, gui = "bold" },
		b = { bg = p.serene, fg = p.ethereal },
		c = { bg = p.serene, fg = p.ethereal, gui = "italic" },
	},
	insert = {
		a = { bg = p.serene, fg = p.ethereal, gui = "bold" },
	},
	visual = {
		a = { bg = p.serene, fg = p.ethereal, gui = "bold" },
	},
	replace = {
		a = { bg = p.serene, fg = p.ethereal, gui = "bold" },
	},
	command = {
		a = { bg = p.serene, fg = p.ethereal, gui = "bold" },
	},
	inactive = {
		a = { bg = p.base, fg = p.dim, gui = "bold" },
		b = { bg = p.base, fg = p.dim },
		c = { bg = p.base, fg = p.dim, gui = "italic" },
	},
}

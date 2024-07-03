--- Apheleio for markid
--- https://github.com/David-Kunz/markid
---
--- @usage
--- local highlights = require("apheleio.plugins.markid")
--- require("nvim-treesitter.configs").setup({ markid = { enable = true, colors = highlights } })

local p = require("apheleio.palette")

return { p.harmony, p.focus, p.serene }

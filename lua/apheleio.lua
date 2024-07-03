local M = {}
local config = require("apheleio.config")

local function set_highlights()
	local utilities = require("apheleio.utilities")
	local palette = require("apheleio.palette")
	local styles = config.options.styles

	local groups = {}
	for group, color in pairs(config.options.groups) do
		groups[group] = utilities.parse_color(color)
	end

	local function make_border(fg)
		fg = fg or groups.border
		return {
			fg = fg,
			bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.calm
				or "NONE",
		}
	end

	local highlights = {}
	local legacy_highlights = {
		["@attribute.diff"] = { fg = palette.whimsy },
		["@boolean"] = { link = "Boolean" },
		["@class"] = { fg = palette.harmony, bold = styles.bold },
		["@conditional"] = { link = "Conditional" },
		["@field"] = { fg = palette.harmony },
		["@include"] = { link = "Include" },
		["@interface"] = { fg = palette.harmony },
		["@macro"] = { link = "Macro" },
		["@method"] = { fg = palette.harmony },
		["@namespace"] = { link = "Include" },
		["@number"] = { link = "Number" },
		["@parameter"] = { fg = palette.bliss },
		["@preproc"] = { link = "PreProc" },
		["@punctuation"] = { fg = palette.bliss },
		["@punctuation.bracket"] = { link = "@punctuation" },
		["@punctuation.delimiter"] = { link = "@punctuation" },
		["@punctuation.special"] = { link = "@punctuation" },
		["@regexp"] = { link = "String" },
		["@repeat"] = { link = "Repeat" },
		["@storageclass"] = { link = "StorageClass" },
		["@symbol"] = { link = "Identifier" },
		["@text"] = { fg = palette.focus },
		["@text.danger"] = { fg = groups.error },
		["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@text.emphasis"] = { italic = styles.italic },
		["@text.environment"] = { link = "Macro" },
		["@text.environment.name"] = { link = "Type" },
		["@text.math"] = { link = "Special" },
		["@text.note"] = { link = "SpecialComment" },
		["@text.strike"] = { strikethrough = true },
		["@text.strong"] = { bold = styles.bold },
		["@text.title"] = { link = "Title" },
		["@text.title.1.markdown"] = { link = "markdownH1" },
		["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@text.title.2.markdown"] = { link = "markdownH2" },
		["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@text.title.3.markdown"] = { link = "markdownH3" },
		["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@text.title.4.markdown"] = { link = "markdownH4" },
		["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@text.title.5.markdown"] = { link = "markdownH5" },
		["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@text.title.6.markdown"] = { link = "markdownH6" },
		["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
		["@text.underline"] = { underline = true },
		["@text.uri"] = { fg = groups.link },
		["@text.warning"] = { fg = groups.warn },
		["@todo"] = { link = "Todo" },

		-- lukas-reineke/indent-blankline.nvim
		IndentBlanklineChar = { fg = palette.whisper, nocombine = true },
		IndentBlanklineSpaceChar = { fg = palette.whisper, nocombine = true },
		IndentBlanklineSpaceCharBlankline = { fg = palette.whisper, nocombine = true },
	}
	local default_highlights = {
		ColorColumn = { bg = palette.calm },
		Conceal = { bg = "NONE" },
		CurSearch = { fg = palette.harmony, bg = palette.serene, bold = styles.bold },
		Cursor = { fg = palette.harmony, bg = palette.serene },
		CursorColumn = { bg = palette.pure },
		-- CursorIM = {},
		CursorLine = { bg = palette.calm },
		CursorLineNr = { fg = palette.harmony, bold = styles.bold },
		-- DarkenedPanel = { },
		-- DarkenedStatusline = {},
		DiffAdd = { bg = groups.git_add, blend = 20 },
		DiffChange = { bg = groups.git_change, blend = 20 },
		DiffDelete = { bg = groups.git_delete, blend = 20 },
		DiffText = { bg = groups.git_text, blend = 20 },
		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
		Directory = { fg = palette.harmony, bold = styles.bold },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = groups.error, bold = styles.bold },
		FloatBorder = make_border(),
		FloatTitle = { link = "Directory" },
		FoldColumn = { fg = palette.dim },
		Folded = { fg = palette.focus, bg = groups.panel },
		IncSearch = { link = "CurSearch" },
		LineNr = { fg = palette.dim },
		MatchParen = { fg = palette.harmony, bg = palette.pure, blend = 16 },
		ModeMsg = { fg = palette.ethereal },
		MoreMsg = { fg = palette.whimsy },
		NonText = { fg = palette.dim },
		Normal = { fg = palette.focus, bg = palette.pure },
		NormalFloat = { bg = groups.panel },
		NormalNC = { fg = palette.focus, bg = config.options.dim_inactive_windows and palette._nc or palette.pure },
		NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { fg = palette.whimsy, bg = groups.panel },
		PmenuExtra = { fg = palette.dim, bg = groups.panel },
		PmenuExtraSel = { fg = palette.whimsy, bg = palette.serene },
		PmenuKind = { fg = palette.ethereal, bg = groups.panel },
		PmenuKindSel = { fg = palette.harmony, bg = palette.serene },
		PmenuSbar = { bg = groups.panel },
		PmenuSel = { fg = palette.focus, bg = palette.serene },
		PmenuThumb = { bg = palette.dim },
		Question = { fg = palette.ethereal },
		-- QuickFixLink = {},
		-- RedrawDebugNormal = {},
		RedrawDebugClear = { fg = palette.pure, bg = palette.whimsy },
		RedrawDebugComposed = { fg = palette.pure, bg = palette.ethereal },
		RedrawDebugRecompose = { fg = palette.pure, bg = palette.harmony },
		Search = { fg = palette.pure, bg = palette.harmony, bold = styles.bold },
		SignColumn = { fg = palette.focus, bg = "NONE" },
		SpecialKey = { fg = palette.harmony },
		SpellBad = { sp = palette.whimsy, undercurl = true },
		SpellCap = { sp = palette.whimsy, undercurl = true },
		SpellLocal = { sp = palette.whimsy, undercurl = true },
		SpellRare = { sp = palette.whimsy, undercurl = true },
		StatusLine = { fg = palette.whimsy, bg = groups.panel },
		StatusLineNC = { fg = palette.dim, bg = groups.panel, blend = 60 },
		StatusLineTerm = { fg = palette.pure, bg = palette.harmony },
		StatusLineTermNC = { fg = palette.pure, bg = palette.harmony, blend = 60 },
		Substitute = { link = "IncSearch" },
		TabLine = { fg = palette.whimsy, bg = groups.panel },
		TabLineFill = { bg = groups.panel },
		TabLineSel = { fg = palette.focus, bg = palette.serene, bold = styles.bold },
		Title = { fg = palette.harmony, bold = styles.bold },
		VertSplit = { fg = groups.border },
		Visual = { bg = palette.highlight_med },
		-- VisualNOS = {},
		WarningMsg = { fg = groups.warn, bold = styles.bold },
		-- Whitespace = {},
		WildMenu = { link = "IncSearch" },
		WinBar = { fg = palette.whimsy, bg = groups.panel },
		WinBarNC = { fg = palette.dim, bg = groups.panel, blend = 60 },
		WinSeparator = { fg = groups.border },

		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
		DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
		DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
		DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
		DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
		DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
		DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
		DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

		Boolean = { fg = palette.ethereal, italic = styles.italic },
		Character = { fg = palette.bliss },
		Comment = { fg = palette.whisper, italic = styles.italic },
		Conditional = { fg = palette.harmony, italic = styles.italic },
		Constant = { fg = palette.ethereal },
		Debug = { fg = palette.harmony },
		Define = { fg = palette.focus, italic = styles.italic },
		Delimiter = { fg = palette.whimsy },
		Error = { fg = palette.harmony, bold = styles.bold },
		Exception = { fg = palette.harmony, bold = styles.bold },
		Float = { fg = palette.harmony },
		Function = { fg = palette.ethereal },
		Identifier = { fg = palette.focus },
		Include = { fg = palette.ethereal },
		Keyword = { fg = palette.ethereal, italic = styles.italic },
		Label = { fg = palette.whimsy },
		LspCodeLens = { fg = palette.whimsy },
		LspCodeLensSeparator = { fg = palette.dim },
		LspInlayHint = { fg = palette.dim, bg = palette.serene, blend = 10 },
		LspReferenceRead = { bg = palette.highlight_med },
		LspReferenceText = { bg = palette.highlight_med },
		LspReferenceWrite = { bg = palette.highlight_med },
		Macro = { fg = palette.harmony },
		Number = { fg = palette.harmony },
		Operator = { fg = palette.bliss },
		PreCondit = { fg = palette.harmony },
		PreProc = { link = "PreCondit" },
		Repeat = { fg = palette.harmony },
		Special = { fg = palette.ethereal },
		SpecialChar = { link = "Special" },
		SpecialComment = { fg = palette.dim, italic = styles.italic },
		Statement = { fg = palette.ethereal, bold = styles.bold },
		StorageClass = { fg = palette.harmony },
		String = { fg = palette.bliss },
		Structure = { fg = palette.harmony, bold = styles.bold },
		Tag = { fg = palette.whimsy },
		Todo = { fg = palette.focus, bg = palette.serene, blend = 8 },
		Type = { fg = palette.ethereal, bold = styles.bold },
		TypeDef = { link = "Type" },
		Underlined = { fg = palette.harmony, underline = true },

		healthError = { fg = groups.error },
		healthSuccess = { fg = groups.info },
		healthWarning = { fg = groups.warn },

		htmlArg = { fg = palette.bliss },
		htmlBold = { bold = styles.bold },
		htmlEndTag = { fg = palette.whimsy },
		htmlH1 = { link = "markdownH1" },
		htmlH2 = { link = "markdownH2" },
		htmlH3 = { link = "markdownH3" },
		htmlH4 = { link = "markdownH4" },
		htmlH5 = { link = "markdownH5" },
		htmlItalic = { italic = styles.italic },
		htmlLink = { link = "markdownUrl" },
		htmlTag = { fg = palette.whimsy },
		htmlTagN = { fg = palette.focus },
		htmlTagName = { fg = palette.harmony },

		markdownDelimiter = { fg = palette.whimsy },
		markdownH1 = { fg = groups.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2 = { fg = groups.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3 = { fg = groups.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4 = { fg = groups.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5 = { fg = groups.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6 = { fg = groups.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText = { link = "markdownUrl" },
		markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

		mkdCode = { fg = palette.highlight_high },
		mkdCodeDelimiter = { fg = palette.bliss },
		mkdCodeEnd = { fg = palette.ethereal },
		mkdCodeStart = { fg = palette.harmony },
		mkdFootnotes = { fg = palette.whimsy },
		mkdID = { fg = palette.harmony, underline = true },
		mkdInlineURL = { link = "markdownUrl" },
		mkdLink = { link = "markdownUrl" },
		mkdLinkDef = { link = "markdownUrl" },
		mkdListItemLine = { fg = palette.focus },
		mkdRule = { fg = palette.whimsy },
		mkdURL = { link = "markdownUrl" },

		--- Identifiers
		["@variable"] = { fg = palette.focus },
		["@variable.builtin"] = { fg = palette.focus, bold = styles.bold },
		["@variable.parameter"] = { fg = palette.bliss },
		["@variable.member"] = { fg = palette.clarity },

		["@constant"] = { fg = palette.harmony },
		["@constant.builtin"] = { fg = palette.harmony, bold = styles.bold },
		["@constant.macro"] = { fg = palette.ethereal },

		["@module"] = { fg = palette.focus },
		["@module.builtin"] = { fg = palette.focus, bold = styles.bold },
		["@label"] = { link = "Label" },

		--- Literals
		["@string"] = { link = "String" },
		-- ["@string.documentation"] = {},
		["@string.regexp"] = { fg = palette.focus },
		["@string.escape"] = { fg = palette.dim },
		["@string.special"] = { link = "String" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.url"] = { fg = groups.link },
		-- ["@string.special.path"] = {},

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"] = { link = "Number" },

		--- Types
		["@type"] = { fg = palette.ethereal },
		["@type.builtin"] = { fg = palette.ethereal, bold = styles.bold },
		-- ["@type.definition"] = {},
		-- ["@type.qualifier"] = {},

		-- ["@attribute"] = {},
		["@property"] = { fg = palette.clarity },

		--- Functions
		["@function"] = { fg = palette.harmony, bold = styles.bold },
		["@function.builtin"] = { fg = palette.ethereal, bold = styles.bold },
		-- ["@function.call"] = {},
		["@function.macro"] = { link = "Function" },
		["@function.method"] = { fg = palette.clarity },
		["@function.method.call"] = { fg = palette.focus, bold = styles.bold },

		["@constructor"] = { fg = palette.focus, italic = styles.italic },
		["@operator"] = { link = "Operator" },

		--- Keywords
		["@keyword"] = { link = "Keyword" },
		-- ["@keyword.coroutine"] = {},
		-- ["@keyword.function"] = {},
		["@keyword.operator"] = { fg = palette.harmony },
		["@keyword.import"] = { fg = palette.focus },
		["@keyword.storage"] = { fg = palette.focus },
		["@keyword.repeat"] = { fg = palette.focus, italic = styles.italic },
		["@keyword.return"] = { fg = palette.focus, italic = styles.italic },
		["@keyword.debug"] = { fg = palette.harmony, bold = styles.bold },
		["@keyword.exception"] = { fg = palette.ethereal, bold = styles.bold },
		["@keyword.conditional"] = { fg = palette.harmony, italic = styles.italic },
		["@keyword.conditional.ternary"] = { fg = palette.harmony, bold = styles.bold },
		["@keyword.directive"] = { fg = palette.ethereal },
		["@keyword.directive.define"] = { fg = palette.ethereal },

		--- Punctuation
		["@punctuation.delimiter"] = { fg = palette.focus },
		["@punctuation.bracket"] = { fg = palette.focus },
		["@punctuation.special"] = { fg = palette.focus },

		--- Comments
		["@comment"] = { link = "Comment" },
		-- ["@comment.documentation"] = {},

		["@comment.error"] = { fg = groups.error },
		["@comment.warning"] = { fg = groups.warn },
		["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 20 },
		["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 20 },
		["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 20 },
		["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 20 },

		--- Markup
		["@markup.strong"] = { bold = styles.bold },
		["@markup.italic"] = { italic = styles.italic },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { fg = palette.ethereal, bold = styles.bold },

		["@markup.quote"] = { fg = palette.whimsy },
		["@markup.math"] = { link = "Special" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "@type" },

		-- ["@markup.link"] = {},
		["@markup.link.markdown_inline"] = { fg = palette.whimsy },
		["@markup.link.label.markdown_inline"] = { fg = palette.harmony },
		["@markup.link.url"] = { fg = groups.link },

		-- ["@markup.raw"] = { bg = palette.calm },
		-- ["@markup.raw.block"] = { bg = palette.calm },
		["@markup.raw.delimiter.markdown"] = { fg = palette.whimsy },

		["@markup.list"] = { fg = palette.focus },
		["@markup.list.checked"] = { fg = palette.harmony, bg = palette.serene, blend = 10 },
		["@markup.list.unchecked"] = { fg = palette.whimsy },

		-- Markdown headings
		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		["@diff.delta"] = { bg = groups.git_change, blend = 20 },

		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = palette.clarity },
		["@tag.delimiter"] = { fg = palette.whimsy },

		--- Non-highlighting captures
		-- ["@none"] = {},
		["@conceal"] = { link = "Conceal" },
		["@conceal.markdown"] = { fg = palette.whimsy },

		-- ["@spell"] = {},
		-- ["@nospell"] = {},

		--- Semantic
		["@lsp.type.comment"] = {},
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@interface" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.namespace.python"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
		["@lsp.type.variable.svelte"] = { link = "@variable" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.variable.constant"] = { link = "@constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },

		--- Plugins
		-- romgrk/barbar.nvim
		BufferCurrent = { fg = palette.focus, bg = palette.serene },
		BufferCurrentIndex = { fg = palette.focus, bg = palette.serene },
		BufferCurrentMod = { fg = palette.ethereal, bg = palette.serene },
		BufferCurrentSign = { fg = palette.whimsy, bg = palette.serene },
		BufferCurrentTarget = { fg = palette.harmony, bg = palette.serene },
		BufferInactive = { fg = palette.whimsy },
		BufferInactiveIndex = { fg = palette.whimsy },
		BufferInactiveMod = { fg = palette.dim },
		BufferInactiveSign = { fg = palette.dim },
		BufferInactiveTarget = { fg = palette.dim },
		BufferTabpageFill = { fg = "NONE", bg = "NONE" },
		BufferVisible = { fg = palette.whimsy },
		BufferVisibleIndex = { fg = palette.whimsy },
		BufferVisibleMod = { fg = palette.harmony },
		BufferVisibleSign = { fg = palette.dim },
		BufferVisibleTarget = { fg = palette.ethereal },

		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { link = "SignAdd" },
		GitSignsChange = { link = "SignChange" },
		GitSignsDelete = { link = "SignDelete" },
		SignAdd = { fg = groups.git_add, bg = "NONE" },
		SignChange = { fg = groups.git_change, bg = "NONE" },
		SignDelete = { fg = groups.git_delete, bg = "NONE" },

		-- mvllow/modes.nvim
		ModesCopy = { bg = palette.ethereal },
		ModesDelete = { bg = palette.ethereal },
		ModesInsert = { bg = palette.harmony },
		ModesReplace = { bg = palette.bliss },
		ModesVisual = { bg = palette.clarity },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = palette.dim },
		NvimTreeFileDeleted = { fg = groups.git_delete },
		NvimTreeFileDirty = { fg = groups.git_dirty },
		NvimTreeFileMerge = { fg = groups.git_merge },
		NvimTreeFileNew = { fg = palette.ethereal },
		NvimTreeFileRenamed = { fg = groups.git_rename },
		NvimTreeFileStaged = { fg = groups.git_stage },
		NvimTreeFolderIcon = { fg = palette.whimsy },
		NvimTreeFolderName = { fg = palette.ethereal },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = palette.focus },
		NvimTreeNormal = { link = "Normal" },
		NvimTreeOpenedFile = { fg = palette.focus, bg = palette.serene },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = palette.harmony, bold = styles.bold },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { link = "StatusLineTerm" },

		-- nvim-neotest/neotest
		NeotestAdapterName = { fg = palette.focus },
		NeotestBorder = { fg = palette.highlight_med },
		NeotestDir = { fg = palette.ethereal },
		NeotestExpandMarker = { fg = palette.highlight_med },
		NeotestFailed = { fg = palette.clarity },
		NeotestFile = { fg = palette.focus },
		NeotestFocused = { fg = palette.focus, bg = palette.highlight_med },
		NeotestIndent = { fg = "" },
		NeotestMarked = { fg = palette.ethereal, bold = styles.bold },
		NeotestNamespace = { fg = palette.focus },
		NeotestPassed = { fg = palette.harmony },
		NeotestRunning = { fg = palette.focus },
		NeotestWinSelect = { fg = palette.dim },
		NeotestSkipped = { fg = palette.whimsy },
		NeotestTarget = { fg = palette.ethereal },
		NeotestTest = { fg = palette.clarity },
		NeotestUnknown = { fg = palette.whimsy },
		NeotestWatching = { fg = palette.ethereal },

		-- nvim-neo-tree/neo-tree.nvim
		NeoTreeGitAdded = { fg = groups.git_add },
		NeoTreeGitConflict = { fg = groups.git_merge },
		NeoTreeGitDeleted = { fg = groups.git_delete },
		NeoTreeGitIgnored = { fg = groups.git_ignore },
		NeoTreeGitModified = { fg = groups.git_dirty },
		NeoTreeGitRenamed = { fg = groups.git_rename },
		NeoTreeGitUntracked = { fg = groups.git_untracked },
		NeoTreeTitleBar = { link = "StatusLineTerm" },

		-- folke/flash.nvim
		FlashLabel = { fg = palette.pure, bg = palette.ethereal },

		-- folke/which-key.nvim
		WhichKey = { fg = palette.harmony },
		WhichKeyDesc = { fg = palette.clarity },
		WhichKeyFloat = { bg = groups.focus },
		WhichKeyGroup = { fg = palette.ethereal },
		WhichKeySeparator = { fg = palette.whimsy },
		WhichKeyValue = { fg = palette.focus },

		-- lukas-reineke/indent-blankline.nvim
		IblIndent = { fg = palette.serene },
		IblScope = { fg = palette.focus },
		IblWhitespace = { fg = palette.serene },

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = palette.clarity },
		CmpItemAbbrDeprecated = { fg = palette.ethereal, strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.harmony, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.ethereal, bold = styles.bold },
		CmpItemKind = { fg = palette.clarity },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "PreProc" },
		CmpItemKindSnippet = { link = "String" },
		CmpItemKindVariable = { link = "Identifier" },

		-- NeogitOrg/neogit
		-- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
		NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
		NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
		NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
		NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
		NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
		NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
		NeogitDiffAddHighlight = { link = "DiffAdd" },
		NeogitDiffContextHighlight = { bg = palette.calm },
		NeogitDiffDeleteHighlight = { link = "DiffDelete" },
		NeogitFilePath = { fg = palette.clarity },
		NeogitHunkHeader = { bg = groups.panel },
		NeogitHunkHeaderHighlight = { bg = groups.panel },

		-- vimwiki/vimwiki
		VimwikiHR = { fg = palette.clarity },
		VimwikiHeader1 = { link = "markdownH1" },
		VimwikiHeader2 = { link = "markdownH2" },
		VimwikiHeader3 = { link = "markdownH3" },
		VimwikiHeader4 = { link = "markdownH4" },
		VimwikiHeader5 = { link = "markdownH5" },
		VimwikiHeader6 = { link = "markdownH6" },
		VimwikiHeaderChar = { fg = palette.whimsy },
		VimwikiLink = { link = "markdownUrl" },
		VimwikiList = { fg = palette.focus },
		VimwikiNoExistsLink = { fg = palette.blush },

		-- nvim-neorg/neorg
		NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
		NeorgHeading1Title = { link = "markdownH1" },
		NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
		NeorgHeading2Title = { link = "markdownH2" },
		NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
		NeorgHeading3Title = { link = "markdownH3" },
		NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
		NeorgHeading4Title = { link = "markdownH4" },
		NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
		NeorgHeading5Title = { link = "markdownH5" },
		NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
		NeorgHeading6Title = { link = "markdownH6" },
		NeorgMarkerTitle = { fg = palette.harmony, bold = styles.bold },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		DefinitionCount = { fg = palette.focus },
		DefinitionIcon = { fg = palette.focus },
		DefinitionPreviewTitle = { fg = palette.focus, bold = styles.bold },
		LspFloatWinBorder = make_border(),
		LspFloatWinNormal = { bg = groups.panel },
		LspSagaAutoPreview = { fg = palette.focus },
		LspSagaCodeActionBorder = make_border(palette.dim),
		LspSagaCodeActionContent = { fg = palette.clarity },
		LspSagaCodeActionTitle = { fg = palette.ethereal, bold = styles.bold },
		LspSagaCodeActionTruncateLine = { link = "LspSagaCodeActionBorder" },
		LspSagaDefPreviewBorder = make_border(),
		LspSagaDiagnosticBorder = make_border(palette.dim),
		LspSagaDiagnosticHeader = { fg = palette.ethereal, bold = styles.bold },
		LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
		LspSagaDocTruncateLine = { link = "LspSagaHoverBorder" },
		LspSagaFinderSelection = { fg = palette.harmony },
		LspSagaHoverBorder = { link = "LspFloatWinBorder" },
		LspSagaLspFinderBorder = { link = "LspFloatWinBorder" },
		LspSagaRenameBorder = make_border(palette.dim),
		LspSagaRenamePromptPrefix = { fg = palette.clarity },
		LspSagaShTruncateLine = { link = "LspSagaSignatureHelpBorder" },
		LspSagaSignatureHelpBorder = make_border(palette.dim),
		ReferencesCount = { fg = palette.clarity },
		ReferencesIcon = { fg = palette.clarity },
		SagaShadow = { bg = palette.serene },
		TargetWord = { fg = palette.harmony },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { bg = palette.serene },

		-- rlane/pounce.nvim
		PounceAccept = { fg = palette.ethereal, bg = palette.calm, blend = 20 },
		PounceAcceptBest = { fg = palette.harmony, bg = palette.serene, blend = 20 },
		PounceGap = { link = "Search" },
		PounceMatch = { link = "Search" },

		-- ggandor/leap.nvim
		LeapLabelPrimary = { link = "IncSearch" },
		LeapLabelSecondary = { link = "StatusLineTerm" },
		LeapMatch = { link = "MatchParen" },

		-- phaazon/hop.nvim
		-- smoka7/hop.nvim
		HopNextKey = { fg = palette.focus, bg = palette.calm, blend = 20 },
		HopNextKey1 = { fg = palette.focus, bg = palette.serene, blend = 20 },
		HopNextKey2 = { fg = palette.pure, bg = palette.ethereal, blend = 20 },
		HopUnmatched = { fg = palette.dim },

		-- nvim-telescope/telescope.nvim
		TelescopeBorder = make_border(),
		TelescopeMatching = { fg = palette.harmony, bold = styles.bold },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.clarity },
		TelescopeSelection = { fg = palette.focus, bg = palette.serene },
		TelescopeSelectionCaret = { fg = palette.pure, bg = palette.ethereal },
		TelescopeTitle = { fg = palette.focus, bold = styles.bold },

		-- ibhagwan/fzf-lua
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaTitle = { fg = palette.harmony, bold = styles.bold },
		FzfLuaBorder = make_border(),
		FzfLuaHeaderText = { fg = palette.focus },
		FzfLuaHeaderBind = { fg = palette.ethereal },
		FzfLuaBufFlagCur = { fg = palette.clarity },
		FzfLuaBufFlagAlt = { fg = palette.clarity },

		-- rcarriga/nvim-notify
		NotifyDEBUGBorder = make_border(),
		NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
		NotifyDEBUGTitle = { fg = palette.clarity },
		NotifyERRORBorder = make_border(groups.error),
		NotifyERRORIcon = { link = "NotifyERRORTitle" },
		NotifyERRORTitle = { fg = groups.error },
		NotifyINFOBorder = make_border(groups.info),
		NotifyINFOIcon = { link = "NotifyINFOTitle" },
		NotifyINFOTitle = { fg = groups.info },
		NotifyTRACEBorder = make_border(palette.dim),
		NotifyTRACEIcon = { link = "NotifyTRACETitle" },
		NotifyTRACETitle = { fg = palette.dim },
		NotifyWARNBorder = make_border(groups.warn),
		NotifyWARNIcon = { link = "NotifyWARNTitle" },
		NotifyWARNTitle = { fg = groups.warn },

		-- rcarriga/nvim-dap-ui
		DapUIBreakpointsCurrentLine = { fg = palette.harmony, bold = styles.bold },
		DapUIBreakpointsDisabledLine = { fg = palette.dim },
		DapUIBreakpointsInfo = { link = "DapUIThread" },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
		DapUIBreakpointsPath = { fg = palette.clarity },
		DapUIDecoration = { link = "DapUIBreakpointsPath" },
		DapUIFloatBorder = make_border(),
		DapUIFrameName = { fg = palette.focus },
		DapUILineNumber = { link = "DapUIBreakpointsPath" },
		DapUIModifiedValue = { fg = palette.clarity, bold = styles.bold },
		DapUIScope = { link = "DapUIBreakpointsPath" },
		DapUISource = { fg = palette.ethereal },
		DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
		DapUIThread = { fg = palette.ethereal },
		DapUIValue = { fg = palette.focus },
		DapUIVariable = { fg = palette.focus },
		DapUIWatchesEmpty = { fg = palette.bliss },
		DapUIWatchesError = { link = "DapUIWatchesEmpty" },
		DapUIWatchesValue = { link = "DapUIThread" },

		-- glepnir/dashboard-nvim
		DashboardCenter = { fg = palette.focus },
		DashboardFooter = { fg = palette.clarity },
		DashboardHeader = { fg = palette.harmony },
		DashboardShortcut = { fg = palette.focus },

		-- SmiteshP/nvim-navic
		NavicIconsArray = { fg = palette.clarity },
		NavicIconsBoolean = { fg = palette.clarity },
		NavicIconsClass = { fg = palette.clarity },
		NavicIconsConstant = { fg = palette.clarity },
		NavicIconsConstructor = { fg = palette.clarity },
		NavicIconsEnum = { fg = palette.clarity },
		NavicIconsEnumMember = { fg = palette.clarity },
		NavicIconsEvent = { fg = palette.clarity },
		NavicIconsField = { fg = palette.clarity },
		NavicIconsFile = { fg = palette.clarity },
		NavicIconsFunction = { fg = palette.clarity },
		NavicIconsInterface = { fg = palette.clarity },
		NavicIconsKey = { fg = palette.clarity },
		NavicIconsKeyword = { fg = palette.clarity },
		NavicIconsMethod = { fg = palette.clarity },
		NavicIconsModule = { fg = palette.clarity },
		NavicIconsNamespace = { fg = palette.clarity },
		NavicIconsNull = { fg = palette.clarity },
		NavicIconsNumber = { fg = palette.clarity },
		NavicIconsObject = { fg = palette.clarity },
		NavicIconsOperator = { fg = palette.clarity },
		NavicIconsPackage = { fg = palette.clarity },
		NavicIconsProperty = { fg = palette.clarity },
		NavicIconsString = { fg = palette.bliss },
		NavicIconsStruct = { fg = palette.clarity },
		NavicIconsTypeParameter = { fg = palette.clarity },
		NavicIconsVariable = { fg = palette.focus },
		NavicSeparator = { fg = palette.whimsy },
		NavicText = { fg = palette.focus },

		-- folke/noice.nvim
		NoiceCursor = { fg = palette.highlight_high, bg = palette.focus },

		-- folke/trouble.nvim
		TroubleText = { fg = palette.focus },
		TroubleCount = { fg = palette.harmony, bg = palette.calm },
		TroubleNormal = { fg = palette.focus, bg = groups.panel },

		-- echasnovski/mini.clue
		MiniClueTitle = { bg = groups.panel, bold = styles.bold },

		-- echasnovski/mini.diff
		MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
		MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
		MiniDiffOverContext = { bg = palette.calm },
		MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
		MiniDiffSignAdd = { fg = groups.git_add },
		MiniDiffSignChange = { fg = groups.git_change },
		MiniDiffSignDelete = { fg = groups.git_delete },

		-- echasnovski/mini.pick
		MiniPickBorderText = { bg = groups.panel },
		MiniPickPrompt = { bg = groups.panel, bold = styles.bold },

		-- echasnovski/mini.indentscope
		MiniIndentscopeSymbol = { fg = palette.whisper },
		MiniIndentscopeSymbolOff = { fg = palette.whisper },

		-- echasnovski/mini.statusline
		MiniStatuslineDevinfo = { fg = palette.focus, bg = palette.serene },
		MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
		MiniStatuslineFilename = { fg = palette.focus, bg = palette.calm },
		MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
		MiniStatuslineModeCommand = { fg = palette.pure, bg = palette.ethereal, bold = styles.bold },
		MiniStatuslineModeInsert = { fg = palette.pure, bg = palette.harmony, bold = styles.bold },
		MiniStatuslineModeNormal = { fg = palette.pure, bg = palette.focus, bold = styles.bold },
		MiniStatuslineModeOther = { fg = palette.pure, bg = palette.clarity, bold = styles.bold },
		MiniStatuslineModeReplace = { fg = palette.pure, bg = palette.ethereal, bold = styles.bold },
		MiniStatuslineModeVisual = { fg = palette.pure, bg = palette.clarity, bold = styles.bold },

		-- goolord/alpha-nvim
		AlphaButtons = { fg = palette.harmony },
		AlphaFooter = { fg = palette.dim },
		AlphaHeader = { fg = palette.focus },
		AlphaShortcut = { fg = palette.whimsy },

		-- github/copilot.vim
		CopilotSuggestion = { fg = palette.dim },

		-- nvim-treesitter/nvim-treesitter-context
		TreesitterContext = { bg = palette.serene },
		TreesitterContextLineNumber = { fg = palette.focus, bg = palette.serene },

		-- RRethy/vim-illuminate
		IlluminatedWordRead = { link = "LspReferenceRead" },
		IlluminatedWordText = { link = "LspReferenceText" },
		IlluminatedWordWrite = { link = "LspReferenceWrite" },
	}
	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		FloatBorder = { fg = palette.dim, bg = "NONE" },
		Folded = { fg = palette.focus, bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		Normal = { fg = palette.focus, bg = "NONE" },
		NormalNC = { fg = palette.focus, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
		Pmenu = { fg = palette.whimsy, bg = "NONE" },
		PmenuKind = { fg = palette.aqua, bg = "NONE" },
		SignColumn = { fg = palette.focus, bg = "NONE" },
		StatusLine = { fg = palette.whimsy, bg = "NONE" },
		StatusLineNC = { fg = palette.dim, bg = "NONE" },
		TabLine = { bg = "NONE", fg = palette.whimsy },
		TabLineFill = { bg = "NONE" },
		TabLineSel = { fg = palette.focus, bg = "NONE", bold = styles.bold },

		-- ["@markup.raw"] = { bg = "none" },
		["@markup.raw.markdown_inline"] = { fg = palette.clarity },
		-- ["@markup.raw.block"] = { bg = "none" },

		TelescopeNormal = { fg = palette.whimsy, bg = "NONE" },
		TelescopePromptNormal = { fg = palette.focus, bg = "NONE" },
		TelescopeSelection = { fg = palette.focus, bg = "NONE", bold = styles.bold },
		TelescopeSelectionCaret = { fg = palette.serene },

		WhichKeyFloat = { bg = "NONE" },

		IblIndent = { fg = palette.focus, bg = "NONE" },
		IblScope = { fg = palette.whimsy, bg = "NONE" },
		IblWhitespace = { fg = palette.serene, bg = "NONE" },

		MiniClueTitle = { bg = "NONE", bold = styles.bold },

		MiniPickBorderText = { bg = "NONE" },
		MiniPickPrompt = { bg = "NONE", bold = styles.bold },
	}

	if config.options.enable.legacy_highlights then
		for group, highlight in pairs(legacy_highlights) do
			highlights[group] = highlight
		end
	end
	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end
	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	-- Reconcile highlights with config
	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			-- Traverse link due to
			-- "If link is used in combination with other attributes; only the link will take effect"
			-- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
			end

			if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
				parsed.inherit = nil
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			else
				parsed.inherit = nil
				highlights[group] = parsed
			end
		end
	end

	for group, highlight in pairs(highlights) do
		if config.options.before_highlight ~= nil then
			config.options.before_highlight(group, highlight, palette)
		end

		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.pure, highlight.blend / 100)
		end

		vim.api.nvim_set_hl(0, group, highlight)
	end

	--- Terminal
	if config.options.enable.terminal then
		vim.g.terminal_color_0 = palette.focus -- black
		vim.g.terminal_color_8 = palette.harmony -- bright black
		vim.g.terminal_color_1 = palette.clarity -- red
		vim.g.terminal_color_9 = palette.clarity -- bright red
		vim.g.terminal_color_2 = palette.bliss -- green
		vim.g.terminal_color_10 = palette.bliss -- bright green
		vim.g.terminal_color_3 = palette.whimsy -- yellow
		vim.g.terminal_color_11 = palette.whimsy -- bright yellow
		vim.g.terminal_color_4 = palette.ethereal -- blue
		vim.g.terminal_color_12 = palette.ethereal -- bright blue
		vim.g.terminal_color_5 = palette.whimsy -- magenta
		vim.g.terminal_color_13 = palette.bliss -- bright magenta
		vim.g.terminal_color_6 = palette.whi -- cyan
		vim.g.terminal_color_14 = palette.bliss -- bright cyan
		vim.g.terminal_color_7 = palette.highlight_high -- white
		vim.g.terminal_color_15 = palette.clarity -- bright white

		-- Support StatusLineTerm & StatusLineTermNC from vim
		vim.cmd([[
		augroup apheleio
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! apheleio
		augroup END
		]])
	end
end

---@param variant Variant | nil
function M.colorscheme(variant)
	config.extend_options({ variant = variant })

	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "apheleio"

	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M

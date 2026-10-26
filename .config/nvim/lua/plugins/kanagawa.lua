return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
	require("kanagawa").setup({
	    compile = false,
	    undercurl = true,
	    commentStyle = { italic = true },
	    transparent = false,         -- do not set background color
	    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
	    colors = {                   -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	    },
	    overrides = function(colors)
		local p = colors.palette
		return {
		    ConflictCurrent = { bg = "#3d6a61" },
		    ConflictCurrentLabel = { bg = "#3d6a61", bold = true },
		    ConflictIncoming = { bg = "#2c5080" },
		    ConflictIncomingLabel = { bg = "#2358ad" , fg = p.sumiInk0, bold = true },
		    ConflictAncestor = { bg = p.winterYellow },
		    ConflictAncestorLabel = { bg = p.boatYellow2, fg = p.sumiInk0, bold = true },
		}
	    end,
	    theme = "dragon",
	})

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd("colorscheme kanagawa")
    end,
}

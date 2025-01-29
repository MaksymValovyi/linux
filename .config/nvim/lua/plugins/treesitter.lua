return {
    -- other plugins
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"bash",
			"c",
			"diff",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		}, -- Add more languages if needed
		auto_install = true,
                highlight = {
                    enable = true, -- Enable Tree-sitter highlighting
		    disable = {"csv, c"},
                },
                indent = {
                    enable = true, -- Enable Tree-sitter based indentation
                },
            })
        end,
    },
}


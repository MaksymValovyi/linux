return{
	{
		"neovim/nvim-lspconfig",
		config=function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup{}
			-- Python (using pyright)
			lspconfig.pyright.setup({})

			-- Java (using jdtls)
			lspconfig.jdtls.setup({})

			-- JavaScript and TypeScript (using ts_ls)
			lspconfig.ts_ls.setup({
				settings = {
					typescript = {
						format = {
							enable = true, -- Enable TypeScript formatting
						},
					},
					javascript = {
						format = {
							enable = true, -- Enable JavaScript formatting
						},
					},
				},
				filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact" }, -- Include JSX/TSX
			})
			-- HTML (using html-language-server)
			lspconfig.html.setup({})

			-- CSS (using css-language-server)
			lspconfig.cssls.setup({})

			-- C++ and C (using clangd)
			lspconfig.clangd.setup({})
		end,
	}
}

return{
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    'saghen/blink.cmp',
	    "folke/lazydev.nvim",
	    ft = "lua", -- only load on lua files
	    opts = {
		library = {
		    -- See the configuration section for more details
		    -- Load luvit types when the `vim.uv` word is found
		    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	    },
	},
	config = function()
	    local capabilities = require('blink.cmp').get_lsp_capabilities()
	    local lspconfig = require("lspconfig")
	    local util = lspconfig.util

	    require("lspconfig").clangd.setup{ capabilities = capabilities }
	    require("lspconfig").lua_ls.setup{
		capabilities = capabilities,
		root_dir = function(fname)
		    -- Force the workspace to be the specified directory
		    return "/home/smallf00t/max"
		end,
		settings = {
		    Lua = {
			workspace = {
			    library = { "/home/smallf00t/max" },
			    checkThirdParty = false,
			},
		    },
		},

	    }
	    require("lspconfig").pylsp.setup{
		settings = {
		    pylsp = {
			plugins = {
			    pycodestyle = {
				ignore = {'W391'},
				maxLineLength = 100
			    }
			}
		    }
		}
	    }
	end,
    }
}

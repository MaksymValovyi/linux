return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    "saghen/blink.cmp",
	    "folke/lazydev.nvim",
	    -- ft = "lua", -- only load on lua files
	    opts = {
		library = {
		    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	    },
	},
	config = function()
	    local capabilities = require("blink.cmp").get_lsp_capabilities()

	    -- clangd
	    vim.lsp.config("clangd", {
		capabilities = capabilities,
	    })
	    vim.lsp.enable("clangd")

	    -- lua_ls
	    vim.lsp.config("lua_ls", {
		capabilities = capabilities,
		-- init.lua marks the nvim config folder, main.lua marks LÖVE projects
		root_markers = { ".luarc.json", "init.lua", "main.lua", ".git" },

		-- When editing the Neovim config, add Neovim's API definitions
		on_init = function(client)
		    local root = client.workspace_folders and client.workspace_folders[1].name
		    if root and root == vim.fn.stdpath("config") then
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			    diagnostics = { globals = { "vim" } },
			    workspace = {
				library = {
				    vim.env.VIMRUNTIME .. "/lua",
				    "${3rd}/luv/library", -- vim.uv / vim.loop
				},
			    },
			})
		    end
		end,

		settings = {
		    Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
			    library = {
				vim.fn.expand("~/.local/share/lua-defs/love2d/library"),
			    },
			    checkThirdParty = false,
			},
			diagnostics = { globals = { "love" } },
			telemetry = { enable = false },
		    },
		},
	    })
	    vim.lsp.enable("lua_ls")
	    --    -- lua_ls
	    --    vim.lsp.config("lua_ls", {
	    -- capabilities = capabilities,
	    -- root_dir = function(fname)
	    --     return "/home/smallf00t/max"
	    -- end,
	    -- settings = {
	    --     Lua = {
	    -- 	workspace = {
	    -- 	    library = { "/home/smallf00t/max" },
	    -- 	    checkThirdParty = false,
	    -- 	},
	    --     },
	    -- },
	    --    })
	    --    vim.lsp.enable("lua_ls")

	    -- pylsp
	    vim.lsp.config("pylsp", {
		capabilities = capabilities,
		root_markers = { ".git" },
		settings = {
		    pylsp = {
			plugins = {
			    pycodestyle = {
				ignore = { "W391" },
				maxLineLength = 100,
			    },
			},
		    },
		},
	    })
	    vim.lsp.enable("pylsp")

	    -- Recognize .scad files as openscad filetype
	    vim.cmd [[ autocmd BufRead,BufNewFile *.scad set filetype=openscad ]]
	    vim.lsp.enable("openscad_ls")
	    vim.lsp.enable("r_language_server")

	    vim.lsp.config("ts_ls", {
		capabilities = capabilities,
	    })

	    vim.lsp.enable("ts_ls")

	    local capabilities = vim.lsp.protocol.make_client_capabilities()
	    capabilities.textDocument.completion.completionItem.snippetSupport = true

	    vim.lsp.config('html', {
		capabilities = capabilities,
	    })

	    vim.lsp.enable('html')

	    --    require('lspconfig').openscad_ls.setup({
	    --      -- optional: override the binary path if not in PATH
	    --      cmd = { "openscad-language-server" },
	    --
	    --      -- optional: add keymaps on LSP attach
	    --      on_attach = function(client, bufnr)
	    -- local opts = { buffer = bufnr }
	    -- vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
	    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	    -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
	    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	    --      end,
	    --    })
	end,
    },
}

-- return{
--     {
-- 	"neovim/nvim-lspconfig",
-- 	dependencies = {
-- 	    'saghen/blink.cmp',
-- 	    "folke/lazydev.nvim",
-- 	    -- ft = "lua", -- only load on lua files
-- 	    opts = {
-- 		library = {
-- 		    -- See the configuration section for more details
-- 		    -- Load luvit types when the `vim.uv` word is found
-- 		    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
-- 		},
-- 	    },
-- 	},
-- 	config = function()
-- 	    local capabilities = require('blink.cmp').get_lsp_capabilities()
-- 	    local lspconfig = require("lspconfig")
-- 	    local util = lspconfig.util
--
-- 	    require("lspconfig").clangd.setup{ capabilities = capabilities }
-- 	    require("lspconfig").lua_ls.setup{
-- 		capabilities = capabilities,
-- 		root_dir = function(fname)
-- 		    -- Force the workspace to be the specified directory
-- 		    return "/home/smallf00t/max"
-- 		end,
-- 		settings = {
-- 		    Lua = {
-- 			workspace = {
-- 			    library = { "/home/smallf00t/max" },
-- 			    checkThirdParty = false,
-- 			},
-- 		    },
-- 		},
--
-- 	    }
-- 	    require("lspconfig").pylsp.setup{
-- 		settings = {
-- 		    pylsp = {
-- 			plugins = {
-- 			    pycodestyle = {
-- 				ignore = {'W391'},
-- 				maxLineLength = 100
-- 			    }
-- 			}
-- 		    }
-- 		}
-- 	    }
-- 	end,
--     }
-- }

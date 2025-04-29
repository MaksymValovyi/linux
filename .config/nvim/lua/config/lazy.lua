-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	rainbow = {
		enable = false,
	},
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	},
	{
		{
			'cameron-wags/rainbow_csv.nvim',
			config = true,
			ft = {
				'csv',
				'tsv',
				'csv_semicolon',
				'csv_whitespace',
				'csv_pipe',
				'rfc_csv',
				'rfc_semicolon'
			},
			cmd = {
				'RainbowDelim',
				'RainbowDelimSimple',
				'RainbowDelimQuoted',
				'RainbowMultiDelim'
			}
		},
	}
)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- enable completion when available
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- see `:h completeopt`
vim.opt.completeopt="menuone,noselect,popup"
-- map <c-space> to activate completion
vim.keymap.set("i", "<c-space>", function() vim.lsp.completion.get() end)
-- map <cr> to <c-y> when the popup menu is visible
vim.keymap.set("i", "<cr>", "pumvisible() ? '<c-y>' : '<cr>'", { expr = true })


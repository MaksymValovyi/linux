vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cl", vim.cmd.noh, {desc = "Clear search highlight"})

-- Remap <C-d> and <C-u> with scrolling centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap { and } to move and center the screen
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

-- Remap <C-d> and <C-u> with scrolling centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Remap <"+y> to copy to clipboard in visual mode
vim.keymap.set("v", "cy", '"+y')

--remap for lsp things
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
--telescope go-to-definition
--vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { noremap = true, silent = true })
--vim remap instead
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })



--disable number for in-build nvim terminal

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function ()
    	vim.opt.number = false
	vim.opt.relativenumber = false
    end,
})

--small terminal at the bottom
vim.keymap.set("n", "<leader>st", function ()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,10)
end)

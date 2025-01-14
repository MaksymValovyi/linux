vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap <C-d> and <C-u> with scrolling centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap <C-d> and <C-u> with scrolling centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Remap <"+y> to copy to clipboard in visual mode
vim.keymap.set("v", "cy", '"+y')


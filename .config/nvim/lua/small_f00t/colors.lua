function ColorMyPencil() 
	-- color = color or "rose-pine"
	color = color or "kanagawa"
	vim.cmd.colorscheme(color) 

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencil()

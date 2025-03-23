return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    },
    config = function()
	vim.keymap.set("n", "<leader>pf", require('telescope.builtin').find_files)
	vim.keymap.set("n", "<leader>en", function ()
	    require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end)
	print("telescope")
    end,
}

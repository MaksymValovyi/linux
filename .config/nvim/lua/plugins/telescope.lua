return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    },
    config = function()
	require('telescope').setup{
	    defaults = {
		-- layout_strategy = 'vertical',
		layout_config = {
		    width = 0.9,
		    height = 0.9,
		    preview_cutoff = 40,
		    preview_width = 0.5
		    -- vertical = { width = 0.3 },
		},
		vimgrep_arguments = {
		  'rg',
		  '--color=never',
		  '--no-heading',
		  '--with-filename',
		  '--line-number',
		  '--column',
		  '--smart-case',
		  '--hidden',
		},
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
		    i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			-- ["<C-h>"] = "which_key"
		    }
		}
	    },
	    pickers = {
		-- find_files = {
		--     theme = "cursor",
		--     previewer = true 
		-- }
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	    },
	    extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	    }
	}
	-- vim.keymap.set("n", "<leader>pf", require('telescope.builtin').find_files{hidden = true})
	vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
	vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string) -- word under cursor
	vim.keymap.set("n", "<leader>pf", require('telescope.builtin').find_files)
	vim.keymap.set("n", "<leader>en", function ()
	    require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end)
	print("telescope")
    end,
}

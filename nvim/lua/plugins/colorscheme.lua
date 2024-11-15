return {
    -- beloved one dark theme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            require('onedark').setup({
                -- style set to the darker variant
                style = 'darker',
                -- style = 'light',
                transparent = true,
                term_colors = true,
                code_style = {
                    comments = 'none',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                    -- comments = 'italic',
                    -- keywords = 'none',
                    -- functions = 'underline',
                    -- strings = 'italic',
                    -- variables = 'bold'
                },
				colors = {
					-- sets the colours of comments to be more readable
					grey = "#7a818e",
				},
                diagnostics = {
                    darker = true,
                    undercurl = true
                },

            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                background = {
                    light = "latte",
                    dark = "macchiato",
                },
                transparent_background = true,
            })
        end,
    },
    -- the goat @devaslife theme
    {
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config =  function()
		  require("solarized-osaka").setup({
			  -- set the background to transparent
			  transparent = true,
		  })
		end,
    },
    -- eldritch theme
    {
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		  require("eldritch").setup({
			  terminal_colors = true,
			  transparent = true,
		  })
		end,
    },
    -- cyberdream theme
    {
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				terminal_colors = true,
				transparent = true,
				italic_comments = true,
				borderless_telescope = true,
			})
		end,
    },
	-- flow theme
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("flow").setup({
				-- enable the dark theme
				dark_theme = true,
				-- make background transparent
				transparent = true,
				-- fluo colour
				fluo_color = "green",
			})
		end,
	},
	-- vague theme
	{
		"vague2k/vague.nvim",
		config = function()
		require("vague").setup({
			-- make the background opaque
			transparent = false,
		})
		end,
	},
	-- base16 black metal theme
	{
		"metalelf0/base16-black-metal-scheme",
	}
}

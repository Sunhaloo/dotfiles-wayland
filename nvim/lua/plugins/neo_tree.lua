return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("neo-tree").setup({
                popup_border_style = "rounded",
                enable_git_status = true,
                sort_case_insensitive = true,
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_by_name = {
                            ".cache",
                            ".npm",
                            ".nv"
                        },
                        sort_order = "asc",
                        always_show = {
                            ".bashrc",
                            ".zshrc",
                            ".tmux.conf",
                            ".git",
                            ".obsidian"
                        },
                    },
                    group_empty_dirs = false,
                },
                default_component_configs = {
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "󰉖",
                        folder_empty_open = "󰷏"
                    }
                }
            })
        end,
    }
}

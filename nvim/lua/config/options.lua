-- create a variable to shortend `vim.opt`
local opt = vim.opt

-- followed Chris@ChrisMachine's Neovim `options.lua` file

-- System
-- don't create a backup file
opt.backup = false
-- allow neovim to use system clipboard
opt.clipboard = "unnamedplus"
-- encoding of file
opt.fileencoding = "utf-8"
-- querying for a "word" does not need to be case sensitive
opt.ignorecase = true
-- querying for case-sensitive words ( if search query have uppercase letters )
opt.smartcase = false
-- keeps the identation of line ( for the next line )
opt.smartindent = true
-- don't create a swap file
opt.swapfile = false
-- amount of time for keymaps to actually register and "confirm"
opt.timeoutlen = 1250
-- allow for persistent undo
opt.undofile = false
-- faster completion time ( default value = 4000ms )
opt.updatetime = 100
-- does not create a backup file
opt.writebackup = false
-- does not use <Space> for <Tab>
opt.expandtab = false
-- number of spaces for a <Tab> character 
opt.tabstop = 4
-- indentation <Space> ( for the next line )
opt.shiftwidth = 4

-- Split Windows / Panes ( " -")
-- horizontal splits will go below the current window / pane
opt.splitbelow = true
-- verital splits will go to the right of the current window / pane
opt.splitright = true

-- Appearance
-- why does we have this?
opt.belloff = "all"
-- hide the neovim command line ( when not in use )
opt.cmdheight = 0
-- shows all syntax character for ( all / most file types )
opt.conceallevel = 0
-- stop the highlighting when leaving the search / query ( mode )
opt.hlsearch = false
-- pop up menus height for things like completion, etc
opt.pumheight = 10
-- enable transparency for pop up menus
opt.pumblend = 0
-- don't show mode in the neovim command line
opt.showmode = false
-- always show file name as tabs / like in VS Code ( 0 ==> disable | 1 ==> when there > 1 | 2 ==> always show )
opt.showtabline = 2
-- allow for more colours
opt.termguicolors = true
-- highlight the current line
opt.cursorline = true
-- show the line and column number separated by a comma
opt.ruler = false
-- display the incomplete command in status line
opt.showcmd = false
-- enable the numbers in the side column
opt.number = true
-- enable the relative line numbers
opt.relativenumber = true
-- icons and errors next to line numbers ( in side column )
opt.signcolumn = "yes"
-- number of lines to keep above / below the caret / cursor ( when scrolling vertically )
opt.scrolloff = 0
-- number of columns to keep to the left / right of caret / cursor  ( when scrolling horizontally )
opt.sidescrolloff = 8
-- will show the full path of the file ( in your terminal )
opt.title = false
-- if `opt.title` is enabled; don't shorten it
opt.titlelen = 0
-- font for GUI versions of Neovim ( programs such as Neovide )
opt.guifont = "Iosevka Nerd Font Mono"
-- disable the intro message for Neovim ( much more clean this way )
opt.shortmess:append("I")
-- disable the top message in 'Lex'
vim.g.netrw_banner = 0
-- allow for mouse usage is 'Lex'
vim.g.netrw_mouse = 2

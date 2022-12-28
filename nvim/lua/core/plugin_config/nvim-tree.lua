vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')


-- Shortcuts
-- `a` -> create new file in selected directory
-- `r` -> rename selected file
-- `f` -> find file
-- `d` -> delete selected file
-- `c` -> copy file to clipboard

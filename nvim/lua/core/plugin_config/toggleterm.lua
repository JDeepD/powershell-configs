require("toggleterm").setup()

-- Leader + t to toggle horizontal split terminal
-- Leader + Leader to toggle floating terminal
-- Leader + Leader to close terminal
vim.keymap.set('n', '<leader>t', ':ToggleTerm size=15 dir=~/Desktop direction=horizontal<CR>')
vim.keymap.set('n', '<leader><leader>', ':ToggleTerm size=15 dir=~/Desktop direction=float<CR>')
vim.keymap.set('t', '<leader><leader>', '<C-\\><C-n>:ToggleTerm<CR>')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _Lazygit_toggle()
	lazygit:toggle()
end

-- Leader + l to open lazygit
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })

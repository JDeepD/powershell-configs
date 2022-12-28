-- Basic Configurations
vim.g.mapleader = " "

vim.o.rnu = true;
vim.o.hidden = true;
vim.o.compatible = false;
vim.o.termguicolors = true;
vim.o.hidden = true;

vim.o.timeoutlen = 500
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.ts = 4
vim.o.sw = 4
vim.o.scrolloff = 6

vim.opt.shortmess:append('c')
vim.opt.mouse:append('a')

-- Keymappings
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>w', '<c-w>')

-- Quickly press <Leader> + ; to add ';'(semicolon) at EOL
vim.keymap.set('n', '<Leader>;', 'mz$a;<Esc>`z')

if (vim.fn.has('windows')) then
	vim.o.shell = 'pwsh'
	-- Required to make ToggleTerm work with powershell
	vim.cmd [[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
		let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
	]]
end

-- Plugins
require("core.plugins")
require("core.plugin_config")

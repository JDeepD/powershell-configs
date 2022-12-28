local db = require('dashboard')

db.preview_file_height = 11
db.preview_file_width = 70

db.custom_center = {
	{ icon = '  ',
		desc = 'Recently latest session                  ',
		shortcut = 'SPC s l',
		action = 'SessionLoad' },
	{ icon = '  ',
		desc = 'Recently opened files                   ',
		action = 'DashboardFindHistory',
		shortcut = 'SPC f h' },
	{ icon = '  ',
		desc = 'Find  File                              ',
		action = 'Telescope find_files find_command=rg,--hidden,--files',
		shortcut = 'SPC f f' },
	{ icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'SPC f w' },
}

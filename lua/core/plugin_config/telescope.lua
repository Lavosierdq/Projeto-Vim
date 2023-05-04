local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>cp', builtin.find_files, {})
vim.keymap.set('n', '<space><space>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

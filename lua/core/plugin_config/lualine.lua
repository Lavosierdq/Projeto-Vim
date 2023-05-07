require('lualine').setup({
    sections = {
        lualine_c = { 'filename', require('pomodoro').statusline }
    },
    options = { section_separators = '', component_separators = '' }
})

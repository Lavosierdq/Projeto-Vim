require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "ruby", "html", "vim","json","java","cpp","c_sharp","bash" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },

}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd","solargraph","html","tsserver","lua_ls",}
})


local on_attach = function(_, _)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,{})
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,{})
vim.keymap.set('n', 'td', vim.lsp.buf.definition,{})
vim.keymap.set('n', 'ti', vim.lsp.buf.implementation,{})
vim.keymap.set('n', 'tr',require('telescope.builtin').lsp.buf.references,{})
vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
end

require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

require("lspconfig").clangd.setup {
  on_attach = on_attach
}

require("lspconfig").solargraph.setup {
  on_attach = on_attach
}

require("lspconfig").html.setup {
  on_attach = on_attach
}

require("lspconfig").tsserver.setup {
  on_attach = on_attach
}

require("lspconfig").cssls.setup {
  on_attach = on_attach
}





--require("lspconfig").lua_ls.setup{}
--require("lspconfig").clangd.setup{}
--require("lspconfig").solargraph.setup{}
--require("lspconfig").html.setup{}
--require("lspconfig").tsserver.setup{}
--require("lspconfig").cssls.setup{}


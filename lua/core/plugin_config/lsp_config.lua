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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {

  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
       
        globals = {"vim"},

      },
      workspace = {
        library = {
          [vim.fn.expand "VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
} 

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities, 
}

require("lspconfig").solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lspconfig").cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}





--require("lspconfig").lua_ls.setup{}
--require("lspconfig").clangd.setup{}
--require("lspconfig").solargraph.setup{}
--require("lspconfig").html.setup{}
--require("lspconfig").tsserver.setup{}
--require("lspconfig").cssls.setup{}


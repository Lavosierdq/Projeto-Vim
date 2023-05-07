local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-treesitter/nvim-treesitter"
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
-- instaling mason and LSP servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
-- instaling CMP for auto-complete and snippets.
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use "L3MON4D3/LuaSnip"
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- esquema de incones
  use 'nvim-tree/nvim-web-devicons'

  -- buffer e barra de baixo da tela
  use{'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'nvim-lualine/lualine.nvim'

  -- Árvore de dados e explorador de arquivos
  use 'nvim-tree/nvim-tree.lua'

  -- esquema de cores para Nvim
  use "lunarvim/darkplus.nvim"
  use 'folke/tokyonight.nvim'
  use "lunarvim/Onedarker.nvim"

  -- esquema para cores de identação
  use "lukas-reineke/indent-blankline.nvim"

  -- auto pairs e substituição de caracteres
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'

 -- esquema de contagem de tempo para  
  use 'wakatime/vim-wakatime'
  use {
    'wthollingsworth/pomodoro.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function()
      require('pomodoro').setup({
        time_work = 30,
        time_break_short = 5,
        time_break_long = 20,
        timers_to_long_break = 4
      })
    end
  }



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

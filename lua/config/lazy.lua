local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.go" }, -- NOTE: change the syntax. makes the var func params to be highlighted differently thanks to semantic highlight enabled. but the * will have the same color as some type liek gin.Context
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    -- { import = "lazyvim.plugins.extras.coding.yanky" }, -- FIX: dont use it for now as it will yank everything. even if the "_dP is remap to not register anything, but this plugin will make register it
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.test.core" },

    -- NOTE: import all of my languages config
    { import = "plugins.extras.lang.go" },
    -- { import = "plugins.extras.lang.rust" },
    { import = "plugins.extras.lang.helm" },

    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },
    { import = "plugins.extras.dap.dap" }, -- NOTE: extend my dap config. make sure to import it below lazyvim dap.core
    { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" }, -- NOTE: use cinnamon.nvim. better in all regards. can animate any motion even gg and { and }
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    { import = "lazyvim.plugins.extras.editor.flash" },
    -- { import = "lazyvim.plugins.extras.vscode" },
    { import = "lazyvim.plugins.extras.ui.edgy" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- NOTE: to remove pesky highlight when using transparent background
-- need to be called last. i think my plugin folder will the one who overwrite if this is called before the plugins
-- is moved to kanaga overrides
-- vim.cmd("highlight FloatBorder guibg=none")
-- vim.cmd("highlight NormalFloat guibg=none")
-- vim.cmd("highlight TelescopeBorder guibg=none")
-- vim.cmd("highlight TelescopeTitle guibg=none")
-- vim.cmd("highlight TelescopeNormal guibg=none")

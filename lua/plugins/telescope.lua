return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf") -- use fzf
      end,
    },

    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor" }, -- NOTE: ignore folder / files for live grep
      },
    },
    keys = {
      -- disable the keymap to grep files. use "sg" instead
      { "<leader>/", false },
      -- change a keymap
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
  },
}

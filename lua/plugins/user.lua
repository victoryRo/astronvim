-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- ================================ Adding Themes =================================
  --NOTE: description themes

  { "jacoborus/tender.vim" },
  { "Th3Whit3Wolf/one-nvim" },

  {
    "luisiacc/gruvbox-baby",
    config = function()
      -- vim.g.gruvbox_baby_background_color = "dark"
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.g.gruvbox_baby_transparent_mode = 0
    end,
  },

  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup {
        mellifluous = {
          neutral = true,
          bg_contrast = "medium", -- options: 'soft', 'medium', 'hard'
        },
      }
    end,
  },

  -- ================================ Adding Plugins ================================

  { "andweeb/presence.nvim" },

  ---- signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  ---- live server
  {
    "barrett-ruth/live-server.nvim",
    config = function() require("live-server").setup() end,
    cmd = { "LiveServerStart", "LiveServerStop" },
  },

  ---- go binaries
  {
    {
      "crispgm/nvim-go",
      event = "User AstroFile",
      config = function()
        require("go").setup {
          -- notify: use nvim-notify
          notify = true,
          -- auto commands
          auto_format = true,
          auto_lint = true,
          -- linters: revive, errcheck, staticcheck, golangci-lint
          linter = "golangci-lint",
        }
      end,
      cmd = { "GoInstallBinaries", "GoUpdateBinaries", "GoTest" },
    },
  },

  ---- lsp show pupup window
  {
    "rmagatti/goto-preview",
    event = "User AstroFile",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 15, -- Height of the floating window
        border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown { hide_preview = false },
        },
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true, -- Focus the floating window when opening it.
        dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
      }
    end,
  },

  ---- indent line
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          use_treesitter = true,
          style = {
            { fg = "#669999" },
            { fg = "#c21f30" },
          },
        },

        indent = {
          use_treesitter = false,
          style = {
            { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui") },
          },
        },
        line_num = {
          enable = false,
          use_treesitter = false,
        },
        blank = {
          enable = false,
        },
      }
    end,
  },

  ---- nvim tree
  {
  "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 47,
        },
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = true,
          },
          icons = {
            git_placement = "after",
            web_devicons = {
              folder = {
                enable = true,
                color = true,
              },
            },
          },
        },
        diagnostics = {
          enable = false,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
    cmd = { "NvimTreeFocus", "NvimTreeToggle" },
  },

    -- ================================ Overriding Plugins ================================

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call

  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- colorscheme = "deus",
    -- colorscheme = "nord",
    -- colorscheme = "onedark",
    -- colorscheme = "gruvbox",
    -- colorscheme = "juliana",
    -- colorscheme = "astrodark",
    -- colorscheme = "solarized",
    colorscheme = "monokai-nightasty",


    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#2b313b" },  -- mariana medium
        -- Normal = { bg = "#272c34" },  -- deus dark
        -- Normal = { bg = "#062623" },  -- deus green
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },

    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "po",
      "go",
      "vim",
      "lua",
      "css",
      "sql",
      "vue",
      "bash",
      "html",
      "json",
      "scss",
      "yaml",
      "regex",
      "jsdoc",
      "gomod",
      "gosum",
      "gowork",
      "markdown",
      "gitcommit",
      "gitignore",
      "git_config",
      "javascript",
      "typescript",
      "markdown_inline",
    })
  end,
}


---------------------- Config vim go plugin -----------------------------------------------\\

vim.cmd [[
   augroup NvimGo
       autocmd!
       autocmd User NvimGoLintPopupPost wincmd p
   augroup END
]]

------------------------------------------------------------------------------------------\\
-- disable some default providers when checkhealth

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

------------------------------------------------------------------------------------------\\
-- makes the background transparent

-- vim.cmd([[
--     hi Normal guibg=NONE ctermbg=NONE
--     hi LineNr guibg=NONE ctermbg=NONE
--     hi SignColumn guibg=NONE ctermbg=NONE
--     hi EndOfBuffer guibg=NONE ctermbg=NONE
-- ]])

------------------------------------------------------------------------------------------\\
-- store code

  -- {
  --   "jackMort/ChatGPT.nvim",
  --     event = "VeryLazy",
  --     config = function()
  --       require("chatgpt").setup({
  --         api_key_cmd = "lala"
  --       })
  --     end,
  --     dependencies = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "folke/trouble.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- },

------------------------------------------------------------------------------------------\\


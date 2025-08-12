-- lua/plugins/telescope.lua

local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
    winblend = 10,
  },
})


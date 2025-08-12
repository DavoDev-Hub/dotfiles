-- Dashboard screen using alpha.nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Header ASCII art (you can change it)
dashboard.section.header.val = {

"    ⠀⠀⣼⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⢸⡆⠀  ",
"    ⠀⢰⣿⠀⠻⠧⣤⡴⣦⣤⣤⣤⣠⡶⣤⣤⠾⠗⠈⣿⠀  ",
"    ⠀⠺⣷⡶⠖⠛⣩⣭⣿⣿⣿⣿⣿⣯⣭⡙⠛⠶⣶⡿⠃  ",
"    ⠀⠀⠀⢀⣤⠾⢋⣴⠟⣿⣿⣿⡟⢷⣬⠙⢷⣄⠀⠀⠀  ",
"    ⢀⣠⡴⠟⠁⠀⣾⡇⠀⣿⣿⣿⡇⠀⣿⡇⠀⠙⠳⣦⣀  ",
"    ⢸⡏⠀⠀⠀⠀⢿⡇⠀⢸⣿⣿⠁⠀⣿⡇⠀⠀⠀⠈⣿  ",
"    ⠀⣷⠀⠀⠀⠀⢸⡇⠀⠀⢻⠇⠀⠀⣿⠇⠀⠀⠀⠀⣿  ",
"    ⠀⢿⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⡏  ",
"⠀    ⠘⡇⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⡾⠀  ",
"    ⠀⠀⠹⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⢰⠁⠀  ",
"    ⠀⠀⠀⠁⠀⠀⠀⠈⢇⠀⠀⠀⠀⡞⠀⠀⠀⠀⠁⠀⠀  ",
"                           ",
"            頑張る           ",
}



-- Buttons
dashboard.section.buttons.val = {
  dashboard.button("f", "-> Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "-> Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("n", "-> New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("c", "-> Config", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("q", "->  Quit", ":qa<CR>"),
}

-- Footer
dashboard.section.footer.val = {
  "Made by DavoDev",
}

-- Apply theme
alpha.setup(dashboard.config)


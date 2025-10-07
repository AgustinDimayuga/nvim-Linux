return {
  {
    "tomasr/molokai",
    enabled = false,
    lazy = false, -- load immediately
    priority = 1000, -- make sure it loads before other plugins
    enabled = false,
    config = function()
      -- Core Molokai setup
      vim.g.molokai_original = 1
      vim.o.background = "dark"
      vim.opt.termguicolors = true

      -- Enable syntax highlighting (usually already on in LazyVim)
      vim.cmd("syntax enable")

      -- Finally, set the colorscheme
      vim.cmd.colorscheme("molokai")
    end,
  },
}

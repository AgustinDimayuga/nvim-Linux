local theme = "dracula" -- "dracula", "gruvbox", or "catppuccin"

local theme_config = {
  dracula = {
    -- No `plugin` here on purpose: Mofiqul/dracula.nvim (configured in
    -- dracula-theme.lua) is already our dracula colorscheme. We used to also
    -- pull in dracula/vim here just for its lightline palette, but that
    -- plugin also ships its own `colors/dracula.vim` and applies itself on
    -- load, racing with dracula.nvim over `:colorscheme dracula` and
    -- flipping some highlight colors (e.g. orange vs purple) depending on
    -- which one won. Its lightline palette is ported locally instead, at
    -- autoload/lightline/colorscheme/dracula.vim.
    colorscheme = "dracula",
    auto_applies = false,
    setup = function() end,
  },
  gruvbox = {
    plugin = "ellisonleao/gruvbox.nvim",
    colorscheme = "gruvbox",
    auto_applies = false,
    setup = function()
      vim.o.background = "dark"
      require("gruvbox").setup({})
    end,
  },
  catppuccin = {
    plugin = "catppuccin/nvim",
    colorscheme = "catppuccin-macchiato",
    -- lightline's bundled theme name uses an underscore, unlike the `:colorscheme` name
    -- (keep this in sync with catppuccin.lua's `flavour` setting)
    lightline_colorscheme = "catppuccin_macchiato",
    auto_applies = false,
    setup = function()
      vim.o.background = "dark"
    end,
  },
}

local chosen = theme_config[theme]

local dependencies = { "tpope/vim-fugitive" }
if chosen.plugin then
  table.insert(dependencies, chosen.plugin)
end

return {
  {
    "itchyny/lightline.vim",
    lazy = false,
    dependencies = dependencies,
    config = function()
      vim.o.showmode = false

      function _G.LightlineFilenameInLua()
        local filename = vim.fn.expand("%:t")
        if filename == "" then
          return "[No Name]"
        end
        return filename
      end
      function _G.LightlineGitBranchInLua()
        local branch = vim.fn.FugitiveHead()
        if branch == nil or branch == "" then
          return ""
        end
        return " " .. branch
      end

      vim.g.lightline = {
        colorscheme = chosen.lightline_colorscheme or chosen.colorscheme,
        active = {
          left = {
            { "mode", "paste" },
            { "gitbranch", "readonly", "filename", "modified" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "fileencoding", "filetype" },
          },
        },
        component_function = {
          filename = "g:LightlineFilename",
          gitbranch = "g:LightlineGitBranch",
        },
      }
      vim.cmd([[
        function! g:LightlineFilename()
          return v:lua.LightlineFilenameInLua()
        endfunction
        function! g:LightlineGitBranch()
          return v:lua.LightlineGitBranchInLua()
        endfunction
      ]])

      chosen.setup()
      if not chosen.auto_applies then
        vim.cmd("colorscheme " .. chosen.colorscheme)
      end

      -- lightline.vim's ColorScheme autocmd can fire before g:lightline above
      -- is applied, so force a refresh now regardless of timing.
      vim.fn["lightline#init"]()
      vim.fn["lightline#colorscheme"]()
      vim.fn["lightline#update"]()
    end,
  },
}

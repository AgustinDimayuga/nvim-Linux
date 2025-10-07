return {
  {
    "itchyny/lightline.vim",
    lazy = false, -- also load at start since it's UI
    dependencies = {
      "tpope/vim-fugitive", -- Add this dependency for git branch
    },
    config = function()
      -- no need to also show mode in cmd line when we have bar
      vim.o.showmode = false
      vim.g.lightline = {
        colorscheme = "powerline", -- Add this line to change the colorscheme
        active = {
          left = {
            { "mode", "paste" },
            { "gitbranch", "readonly", "filename", "modified" }, -- Added gitbranch here
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "fileencoding", "filetype" },
          },
        },
        component_function = {
          filename = "LightlineFilename",
          gitbranch = "FugitiveHead", -- Added this line
        },
      }
      function LightlineFilenameInLua(opts)
        if vim.fn.expand("%:t") == "" then
          return "[No Name]"
        else
          return vim.fn.getreg("%")
        end
      end
      -- https://github.com/itchyny/lightline.vim/issues/657
      vim.api.nvim_exec(
        [[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
        true
      )
    end,
  },
}

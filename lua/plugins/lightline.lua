return {
  {
    "itchyny/lightline.vim",
    lazy = false,
    dependencies = {
      "tpope/vim-fugitive",
      "dracula/vim",
    },
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

        -- pick one icon your font supports
        return " " .. branch
        -- alternatives:
        -- return " " .. branch
        -- return " " .. branch
      end

      vim.g.lightline = {
        colorscheme = "dracula",
        active = {
          left = {
            { "mode",      "paste" },
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
    end,
  },
}

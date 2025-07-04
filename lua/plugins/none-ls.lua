return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          command = "/run/current-system/sw/bin/stylua",
        }),
        null_ls.builtins.formatting.black, -- python
        null_ls.builtins.formatting.prettier, -- javascript html md
        null_ls.builtins.formatting.nixpkgs_fmt,
      },
    })
  end,
}

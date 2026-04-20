return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        stylua = {
          command = "/run/current-system/sw/bin/stylua",
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}

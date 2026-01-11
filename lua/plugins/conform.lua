-- stylua: ignore
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- "*" matches all filetypes
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
    },
  },
}

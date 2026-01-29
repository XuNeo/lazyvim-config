return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_installation = false,
    },
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Continue" },
      { "<S-F5>", function() require("dap").run_last() end, desc = "Run Last" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Method" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug Class" },
    },
    config = function()
      -- Use current python from pyenv instead of Mason's debugpy-adapter
      require("dap-python").setup("python")
    end,
  },
}

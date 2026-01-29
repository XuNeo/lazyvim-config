# LazyVim Python 调试配置

## 已启用的 Extras

在 `lazyvim.json` 中添加了：
- `lazyvim.plugins.extras.dap.core` - DAP 调试核心
- `lazyvim.plugins.extras.lang.python` - Python 语言支持

## 依赖

- **debugpy**: Python 调试适配器
  ```bash
  pip install debugpy
  ```

## 快捷键

### F 键（类似 VS Code）

| 快捷键 | 功能 |
|--------|------|
| `F5` | 继续执行 / 启动调试 |
| `Shift+F5` | 重新运行上次调试（保留参数） |
| `F9` | 设置/取消断点 |
| `F10` | Step Over (单步跳过) |
| `F11` | Step Into (进入函数) |
| `Shift+F11` | Step Out (跳出函数) |
| `F12` | Step Out (跳出函数) |

### Leader 键

| 快捷键 | 功能 |
|--------|------|
| `<leader>db` | 切换断点 |
| `<leader>dB` | 条件断点 |
| `<leader>dc` | 继续执行 |
| `<leader>dC` | 运行到光标处 |
| `<leader>dt` | 终止调试 |
| `<leader>dr` | 切换 REPL |
| `<leader>du` | 打开 DAP UI |
| `<leader>de` | 查看变量值 (Eval) |
| `<leader>dPt` | 调试当前测试方法 |
| `<leader>dPc` | 调试当前测试类 |

## 使用流程

1. 打开 Python 文件
2. `F9` 在目标行设置断点（行号旁显示红点）
3. `F5` 启动调试，选择 "Launch file"
4. 输入命令行参数（如需要）
5. 程序停在断点后：
   - `F10` - Step Over（执行当前行，不进入函数）
   - `F11` - Step Into（进入函数内部）
   - `Shift+F11` - Step Out（跳出当前函数）
   - `<leader>de` - 查看光标下变量的值
   - `<leader>du` - 打开完整调试 UI
6. 再次调试时，`Shift+F5` 可直接使用上次的参数

## DAP UI 界面

调试时会显示：
- **Scopes** - 当前作用域的变量
- **Breakpoints** - 所有断点列表
- **Stacks** - 调用栈
- **Watches** - 监视表达式
- **Console** - 调试控制台

## 配置文件

`~/.config/nvim/lua/plugins/dap.lua`:

```lua
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
      require("dap-python").setup("python")
    end,
  },
}
```

## 故障排除

### debugpy-adapter command not found

如果使用 pyenv，确保在当前 Python 版本中安装 debugpy：
```bash
pip install debugpy
```

### 查看调试日志

在 Neovim 中运行：
```
:DapShowLog
```

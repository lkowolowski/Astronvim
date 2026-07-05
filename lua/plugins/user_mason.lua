---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "bash-language-server",
        "awk-language-server",
        "marksman",
        "texlab",
        "stylua",
        "shellcheck",
        "shfmt",
        "basedpyright",
        "prettier",
        "ruff",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
      integrations = {
        ["mason-lspconfig"] = true,
        -- ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    },
  },
}

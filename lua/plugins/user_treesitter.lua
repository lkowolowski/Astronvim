-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "dockerfile",
      "json",
      "lua",
      "make",
      "markdown",
      "python",
      "vim",
      "yaml",
      -- "css",
      -- "html",
      -- "javascript",
      -- "typescript",
      -- add more arguments for adding more treesitter parsers
    },
  },
}

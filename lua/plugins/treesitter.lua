return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua", "python", "javascript", "typescript",
        "rust", "go", "c", "cpp", "bash",
        "json", "yaml", "toml", "markdown",
      },
      auto_install = true,
    })
  end,
}

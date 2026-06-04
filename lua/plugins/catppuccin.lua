return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = true,
        mason = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        harpoon = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}

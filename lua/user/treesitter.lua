require("nvim-treesitter").setup()

-- Enable treesitter highlighting for all buffers natively (nvim-treesitter v2)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

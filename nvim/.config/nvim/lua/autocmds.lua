require "nvchad.autocmds"

-- Reload highlights on receiving SIGUSR1
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    dofile(vim.g.base46_cache .. "defaults")
    dofile(vim.g.base46_cache .. "statusline")
    vim.cmd("redraw!")
  end,
})

local carbon_status_ok, carbon = pcall(require, "carbon-now")
if not carbon_status_ok then
  vim.notify("carbon not found")
end

carbon.setup({})

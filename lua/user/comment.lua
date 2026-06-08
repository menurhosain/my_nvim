local ts_ok, ts_context = pcall(require, "ts_context_commentstring")
if not ts_ok then
	return
end

ts_context.setup { enable_autocmd = false }

local ok, comment = pcall(require, "Comment")
if not ok then
	return
end

comment.setup {
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

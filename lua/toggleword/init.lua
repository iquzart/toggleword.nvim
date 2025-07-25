local M = {}

-- Toggle groups (list format, instead of key-value)
M.toggle_groups = {
	{ "true", "false" },
	{ "on", "off" },
	{ "enabled", "disabled" },
	{ "yes", "no" },
	{ "up", "down" },
	{ "start", "stop" },
	{ "open", "close" },
	{ "allow", "deny" },
	{ "accept", "reject" },
	{ "read", "write" },
	{ "push", "pull" },
	{ "inbound", "outbound" },
	{ "public", "private" },
	{ "online", "offline" },
	{ "local", "remote" },
	{ "master", "slave" },
	{ "primary", "replica" },
	{ "active", "passive" },
	{ "manual", "automatic" },

	-- Environment cycle group
	{ "prod", "uat", "dev", "preprod" },
}

function M.toggle_word()
	local word = vim.fn.expand("<cword>")
	for _, group in ipairs(M.toggle_groups) do
		local idx = vim.fn.index(group, word)
		if idx ~= -1 then
			local next_word = group[(idx + 1) % #group + 1]
			vim.cmd("normal! ciw" .. next_word)
			return
		end
	end
	vim.notify("No toggle match for: " .. word, vim.log.levels.WARN)
end

function M.setup(opts)
	opts = opts or {}
	if opts.toggle_groups then
		M.toggle_groups = opts.toggle_groups
	end
	vim.keymap.set("n", opts.key or "<leader>tt", M.toggle_word, {
		desc = "Toggle word under cursor",
		noremap = true,
		silent = true,
	})
end

return M

local M = {}

-- Toggle groups (list format, instead of key-value)
M.toggle_groups = {
	-- Boolean toggle group
	{ "true", "false" },
	{ "yes", "no" },
	{ "on", "off" },
	{ "enabled", "disabled" },

	-- Status and activity toggle group
	{ "start", "stop" },
	{ "active", "passive" },
	{ "manual", "automatic" },

	-- Directional toggle group
	{ "up", "down" },
	{ "inbound", "outbound" },
	{ "push", "pull" },
	{ "read", "write" },

	-- State/visibility toggle group
	{ "open", "close" },
	{ "online", "offline" },
	{ "public", "private" },

	-- Control toggle group
	{ "allow", "deny" },
	{ "accept", "reject" },

	-- Environment toggle group
	{ "prod", "uat", "dev", "preprod" },

	-- Location toggle group
	{ "local", "remote" },

	-- Role toggle group
	{ "master", "slave" },
	{ "primary", "replica" },
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

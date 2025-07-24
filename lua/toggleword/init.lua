local M = {}

-- Extended toggle map with multi-value cycling support
M.toggles = {
	["true"] = { "false" },
	["false"] = { "true" },
	["on"] = { "off" },
	["off"] = { "on" },
	["enabled"] = { "disabled" },
	["disabled"] = { "enabled" },
	["yes"] = { "no" },
	["no"] = { "yes" },
	["up"] = { "down" },
	["down"] = { "up" },
	["start"] = { "stop" },
	["stop"] = { "start" },
	["open"] = { "close" },
	["close"] = { "open" },
	["allow"] = { "deny" },
	["deny"] = { "allow" },
	["accept"] = { "reject" },
	["reject"] = { "accept" },
	["read"] = { "write" },
	["write"] = { "read" },
	["push"] = { "pull" },
	["pull"] = { "push" },
	["inbound"] = { "outbound" },
	["outbound"] = { "inbound" },
	["public"] = { "private" },
	["private"] = { "public" },
	["online"] = { "offline" },
	["offline"] = { "online" },
	["local"] = { "remote" },
	["remote"] = { "local" },
	["master"] = { "slave" },
	["slave"] = { "master" },
	["primary"] = { "replica" },
	["replica"] = { "primary" },
	["active"] = { "passive" },
	["passive"] = { "active" },
	["manual"] = { "automatic" },
	["automatic"] = { "manual" },

	-- Environments toggle
	["prod"] = { "uat", "dev", "preprod" },
	["uat"] = { "dev", "preprod", "prod" },
	["dev"] = { "preprod", "prod", "uat" },
	["preprod"] = { "prod", "uat", "dev" },
}

-- Toggle word under cursor, cycling through defined alternates
function M.toggle_word()
	local word = vim.fn.expand("<cword>")
	for key, values in pairs(M.toggles) do
		if word == key then
			vim.cmd("normal! ciw" .. values[1])
			return
		elseif vim.tbl_contains(values, word) then
			local idx = vim.fn.index(values, word)
			local next_idx = (idx + 1) % #values
			vim.cmd("normal! ciw" .. values[next_idx + 1])
			return
		end
	end
	vim.notify("No toggle match for: " .. word, vim.log.levels.WARN)
end

-- Optional setup: override toggles or keybinding
-- @param opts table|nil: { key = "<leader>tt", toggles = table }
function M.setup(opts)
	opts = opts or {}
	if opts.toggles then
		M.toggles = opts.toggles
	end
	vim.keymap.set("n", opts.key or "<leader>tt", M.toggle_word, {
		desc = "Toggle word under cursor",
		noremap = true,
		silent = true,
	})
end

return M

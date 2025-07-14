local M = {}

M.toggles = {
	["true"] = "false",
	["false"] = "true",
	["on"] = "off",
	["off"] = "on",
	["enabled"] = "disabled",
	["disabled"] = "enabled",
	["yes"] = "no",
	["no"] = "yes",
	["up"] = "down",
	["down"] = "up",
}

--- Toggle the word under the cursor if it's in the toggle list
function M.toggle_word()
	local word = vim.fn.expand("<cword>")
	local replacement = M.toggles[word]
	if replacement then
		vim.cmd("normal! ciw" .. replacement)
	else
		vim.notify("No toggle match for: " .. word, vim.log.levels.WARN)
	end
end

--- Setup keybindings and allow custom toggle pairs
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

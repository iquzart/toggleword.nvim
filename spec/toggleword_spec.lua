describe("toggleword", function()
	local toggleword = require("toggleword")

	-- helper to extract the next word from a group
	local function get_next_word(word)
		for _, group in ipairs(toggleword.toggle_groups) do
			for idx, val in ipairs(group) do
				if val == word then
					return group[(idx % #group) + 1]
				end
			end
		end
		return nil
	end

	it("should toggle 'true' to 'false'", function()
		assert.are.same(get_next_word("true"), "false")
	end)

	it("should toggle 'yes' to 'no'", function()
		assert.are.same(get_next_word("yes"), "no")
	end)

	it("should toggle 'prod' to 'uat'", function()
		assert.are.same(get_next_word("prod"), "uat")
	end)

	it("should toggle 'uat' to 'dev'", function()
		assert.are.same(get_next_word("uat"), "dev")
	end)

	it("should toggle 'dev' to 'preprod'", function()
		assert.are.same(get_next_word("dev"), "preprod")
	end)

	it("should toggle 'preprod' to 'prod'", function()
		assert.are.same(get_next_word("preprod"), "prod")
	end)

	it("should toggle 'enabled' to 'disabled'", function()
		assert.are.same(get_next_word("enabled"), "disabled")
	end)

	it("should toggle 'push' to 'pull'", function()
		assert.are.same(get_next_word("push"), "pull")
	end)

	it("should toggle 'offline' to 'online'", function()
		assert.are.same(get_next_word("offline"), "online")
	end)
end)

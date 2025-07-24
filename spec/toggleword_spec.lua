describe("toggleword", function()
	local toggleword = require("toggleword")

	it("should toggle 'true' to 'false'", function()
		assert.are.same(toggleword.toggles["true"], { "false" })
	end)

	it("should toggle 'yes' to 'no'", function()
		assert.are.same(toggleword.toggles["yes"], { "no" })
	end)

	it("should toggle 'prod' to 'uat', 'dev', 'preprod'", function()
		assert.are.same(toggleword.toggles["prod"], { "uat", "dev", "preprod" })
	end)

	it("should toggle 'dev' to 'preprod', 'prod', 'uat'", function()
		assert.are.same(toggleword.toggles["dev"], { "preprod", "prod", "uat" })
	end)

	it("should toggle 'enabled' to 'disabled'", function()
		assert.are.same(toggleword.toggles["enabled"], { "disabled" })
	end)

	it("should toggle 'push' to 'pull'", function()
		assert.are.same(toggleword.toggles["push"], { "pull" })
	end)

	it("should toggle 'offline' to 'online'", function()
		assert.are.same(toggleword.toggles["offline"], { "online" })
	end)
end)

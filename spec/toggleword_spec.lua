-- spec/toggleword_spec.lua
describe("toggleword", function()
	local toggleword = require("toggleword")

	it("should toggle 'true' to 'false'", function()
		assert.are.equal(toggleword.toggles["true"], "false")
	end)

	it("should toggle 'yes' to 'no'", function()
		assert.are.equal(toggleword.toggles["yes"], "no")
	end)
end)

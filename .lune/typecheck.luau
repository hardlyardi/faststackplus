-- This file is adapted from https://github.com/ffrostfall/crunchyroll/blob/52dcd37a0db3ab68e84c61e446f86a9e6bd670e4/.lune/analyze.luau
local fs = require("@lune/fs")
local net = require("@lune/net")
local process = require("@lune/process")

if not fs.isFile("globalTypes.d.luau") then
	local response =
		net.request("https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/refs/heads/main/scripts/globalTypes.d.luau")

	assert(response.ok, response.statusMessage)

	fs.writeFile("globalTypes.d.luau", response.body)
end

local result = process.exec("luaulsp", {
	"analyze",
	"--base-luaurc=.luaurc",
	"--flag:LuauSolverV2=true",
	"src",
}, {
	stdio = "forward",
})

if result.code ~= 0 then
	print(`typechecking failure! exit code: {result.code}`) --
end

print("hi")

process.exit(result.code)

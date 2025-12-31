local process = require("@lune/process")

local args = process.args

local parameters = {
	--[[
	Directories
	]]
	".lune",
	"src",
	"tests/.specs",
	"tests/.benchmarks",
}

if table.find(args, "--fix") or table.find(args, "-f") then
	local result = process.exec("stylua", parameters, {
		stdio = "forward",
	})

	if result.code ~= 0 then
		print(`styling (fix) failure! exit code: {result.code}`) --
	end

	process.exit(result.code)
end

table.insert(parameters, "--check") --

local result = process.exec("stylua", parameters, {
	stdio = "forward",
})

if result.code ~= 0 then
	print(`styling failure! exit code: {result.code}`) --
end

process.exit(result.code)

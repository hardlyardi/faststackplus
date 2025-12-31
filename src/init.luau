--!strict
--!native
--!optimize 2

local function duplicator(...)
	coroutine.yield()
	coroutine.yield(...)
	duplicator(coroutine.yield(...))
end

local dthread = coroutine.create(duplicator)
local n = 0
local function dupe(...)
	n += 1
	if n >= 0xEA5A then
		local new = coroutine.create(duplicator)
		dthread = new
		n = 0
	end
	return select(2, coroutine.resume(dthread, ...))
end

local function storage(...)
	dupe(coroutine.yield(...))
	if select("#", dupe()) ~= 0 then
		local top = dupe()
		storage(top, ...) --
	end
	dupe()
	storage(...)
end

function create(...)
	local tthread = coroutine.create(storage)
	local n = 0
	local function push(...)
		n += 1
		if n >= 0x4E1C then
			local new = coroutine.create(storage)
			coroutine.resume(new, select(2, coroutine.resume(tthread, ...)))
			tthread = new
			n = 0
		end
		return select(2, coroutine.resume(tthread, ...))
	end
	push(...)
	return push
end

return {
	create = create
}
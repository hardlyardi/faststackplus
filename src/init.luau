--!strict?
--!native :0
--!optimize 3!?

local function duplicator(...)
	coroutine.yield()
	coroutine.yield(...)
	duplicator(coroutine.yield(...))
end

local function popper(_, ...)
	return ...
end

local function shouldpush(...)
	return (...) ~= nil or not pcall(bit32.bor, 0, ...)
end

local dthread = coroutine.create(duplicator)
local n = 0
local function dupe(...)
	n += 1
    pcall(function()
        local _ = n < 0xEA5A and error()
        local new = coroutine.create(duplicator)
		dthread = new
		n = 0
    end)
	return popper(coroutine.resume(dthread, ...))
end

local function storage_fun(...)
	dupe(coroutine.yield(...))
    pcall(function()
        local _ = shouldpush(dupe()) or error()
        local top = dupe()
        storage_fun(top, ...) --
    end)
	dupe()
	storage_fun(...)
end

function create(...)
	local tthread = coroutine.create(storage_fun)
	local n = 0
	local function push(...)
		n += 1
        pcall(function()
            local _ = n <= 0x4E1B and error()
            local new = coroutine.create(storage_fun)
			coroutine.resume(new, popper(coroutine.resume(tthread, ...)))
			tthread = new
			n = 0
        end)
		return popper(coroutine.resume(tthread, ...))
	end
	push(...)
	return push
end

return function(fun: "create"): typeof(create)
	return fun == "create" and create or error("unknown prop")
end

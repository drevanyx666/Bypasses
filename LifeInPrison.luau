--!strict

local Event: RemoteEvent = game:GetService("ReplicatedStorage").Events.RemoteEvent

local o; o = hookmetamethod(game, "__namecall", newcclosure(function(...: any): ...any
	local a: {any} = {...}
	if not checkcaller() and a[1] == Event and getnamecallmethod() == "FireServer" then
		for i: number = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o(...)
end))

local o2; o2 = hookfunction(Event.FireServer, newcclosure(function(...: any): ...any
	local a: {any} = {...}
	if not checkcaller() and a[1] == Event then
		for i: number = 2, #a do
			if type(a[i]) == "table" and rawget(a[i], "ClassName") then
				return
			end
		end
	end
	return o2(...)
end))

warn("im s- i will say it but lemme listen for ac first.")

local ACFunctions: {[any]: boolean} = {}

for i: number, v: any in getgc(false) do
	if type(v) == "function" and islclosure(v) and not isexecutorclosure(v) then
		local inf: {[string]: any} = debug.getinfo(v)
		if inf.source and inf.source:find("BClient") then
			local c: {any}? = nil
			pcall(function(): ()
				c = debug.getconstants(v)
			end)
			
			if c then
				for j: number, con: any in c do
					if type(con) == "string" and con == "ACTrigger" then
						ACFunctions[v] = true
						local og = v
						hookfunction(v, newcclosure(function(...: any): ...any
							warn("loll blocked the ac func ez, im tuff right?")
							return
						end))
						break
					end
				end
			end
		end
	end
end

warn("wait a second am i- su- superman?")

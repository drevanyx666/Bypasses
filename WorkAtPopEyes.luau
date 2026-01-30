for Info, Function in getgc(false) do
	if type(Function) == "function" and islclosure(Function) and not isexecutorclosure(Function) then
		local FunctionInfo = debug.getinfo(Function)
		if FunctionInfo.source then
			local Source = FunctionInfo.source
			if Source:find("ReplicatedFirst") or Source:find('PlayerScripts["Essentials Code"]') then
				hookfunction(Function, function() end)
			end
		end
	end
end

warn("ez and ok")

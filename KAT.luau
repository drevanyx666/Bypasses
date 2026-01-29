for idx, thread in getreg() do
	if type(thread) == "thread" then
		local source = debug.info(thread, 1, "s")
		if source and source:find("ReplicatedFirst") then
			coroutine.close(thread)
			warn("ok")
		end
	end
end

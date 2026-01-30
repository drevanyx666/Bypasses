-- rex-rbx was here
local scripts = {}
for i,v in filtergc("function", {Constants = {"Luraph Script:"}}) do
    if getfenv(v).script and not table.find(scripts, getfenv(v).script) then
        table.insert(scripts, getfenv(v).script)
    end
end
for i,v in getgc() do
    if typeof(v) == "function" and islclosure(v) and not isexecutorclosure(v) and table.find(scripts, getfenv(v).script) then
        for k, j in getconstants(v) do
            if typeof(j) == "string" then
                setconstant(v, k, "")
            elseif typeof(j) == "number" then
                setconstant(v, k, 0)
            end
        end
        for k, j in getupvalues(v) do
            if typeof(j) == "string" then
                setupvalue(v, k, "")
            elseif typeof(j) == "number" then
                setupvalue(v, k, 0)
            end
        end
        setfenv(v, {})
    end
end
for i,v in pairs(scripts) do
    for k, j in getscripts() do
        if j == v then
            v.Disabled = true
            v.Parent = nil
            v:Destroy()
        end
    end
end

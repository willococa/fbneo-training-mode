print("DEBUG: Type of guipages: " .. type(guipages))
if type(guipages) == "table" then
    print("DEBUG: Keys in guipages:")
    for k, v in pairs(guipages) do
        print("  " .. tostring(k) .. " (" .. type(v) .. ")")
    end
    if guipages.main then
        print("DEBUG: guipages.main exists. Type: " .. type(guipages.main))
    else
        print("DEBUG: guipages.main does NOT exist.")
    end
else
    print("DEBUG: guipages is nil or not a table")
end

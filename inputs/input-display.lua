assert(rb,"Run fbneo-training-mode.lua")

--[[
FBA-rr and MAME-rr input display script
written by Dammit
last update 8/9/2010

User: Do not edit this file.
This script depends on input-modules.lua.
]]

if not (mame or fba) then error("This script is only intended for FBA-rr and MAME-rr.", 0) end
if not emu.registerstart then error("This script requires a newer version of FBA-rr.", 0) end

col,inp,module = {},{}
dofile("inputs\\input-modules.lua","r")

local function generic() --try to detect controls and make a generic module
	local c,width,height = joypad.get(),emu.screenwidth(),emu.screenheight()
	local stick,nbuttons,nplayers,label = 0,0,1
	if c["P1 Up"] ~= nil and c["P1 Down"] ~= nil and c["P1 Left"] ~= nil and c["P1 Right"] ~= nil then stick = 1 end
	for b=10,1,-1 do
		for k,v in ipairs({"P1 Button "..b, "P1 Fire "..b}) do
			if c[v] ~= nil then
				nbuttons = b
				label = v:gsub("[(P1)(%d+)]", "")
				break
			end
		end
		if nbuttons > 0 then break end
	end
	for n=4,1,-1 do if c["P"..n.." Button 1"] ~= nil or c["P"..n.." Fire 1"] ~= nil then nplayers = n break end end
	if stick+nbuttons == 0 then inputDisplayReg=false return end -- found neither stick nor buttons, can't use this
	
	print("Generic input simpleinputdisplayenabled: "..nplayers.."-player, "..nbuttons.."-button"..(stick > 0 and "" or ", no joystick")) print()
	module = {}
	if stick > 0 then
		for n=1,nplayers do
			module[n.."^"] = {(n-1)/n*width+0x10, height-0x10, "P"..n.." Up"}
			module[n.."v"] = {(n-1)/n*width+0x10, height-0x08, "P"..n.." Down"}
			module[n.."<"] = {(n-1)/n*width+0x08, height-0x0c, "P"..n.." Left"}
			module[n..">"] = {(n-1)/n*width+0x18, height-0x0c, "P"..n.." Right"}
		end
	end
	for n=1,nplayers do
		for b=1,nbuttons do
			module[n..b] = {(n-1)/n*width+stick*0x18+0x8 + math.floor((b-1)%(nbuttons/2))*0x8,
				height-0x10 + math.floor((b-1)*2/nbuttons)*0x08, "P"..n..label..b}
		end
	end
	for n=1,nplayers do
		for k,v in ipairs({n..(n==1 and " Player" or " Players").." Start", "P"..n.." Start", "Start "..n}) do
			if c[v] ~= nil then
				module[n.."S"] = {(n-1)/n*width, height-0x10, v}
				break
			end
		end
		for k,v in ipairs({"Coin "..n, "P"..n.." Coin"}) do
			if c[v] ~= nil then
				module[n.."c"] = {(n-1)/n*width, height-0x08, v}
				break
			end
		end
	end
end

local function displayfunc()
	
	for k,v in pairs(module) do
		local color1,color2 = col.on1,col.on2
		if v[5] and v[6] then --analog control
			gui.text(v[1]+v[5], v[2]+v[6], tostring(joypad.get()[v[3]]), color1, color2) --simpleinputdisplayenabled analog value (unused)
		elseif joypad.get()[v[3]] == false then --digital control, unpressed
			color1,color2 = col.off1,col.off2
		end --(otherwise digital control, pressed)
		if string.sub(k, 1, 1)=="2" then -- only working for two players
			if inputs.properties.simpleinput.simplestate[2] then
				gui.text(inputs.properties.simpleinput.simpleinputxoffset[2]+(v[1]-module["2c"][1]), inputs.properties.simpleinput.simpleinputyoffset[2]+(v[2]-module["2^"][2]), string.sub(k, 2), color1, color2)
			end
		else
			if inputs.properties.simpleinput.simplestate[1] then
				gui.text(inputs.properties.simpleinput.simpleinputxoffset[1]+(v[1]-module["1c"][1]), inputs.properties.simpleinput.simpleinputyoffset[1]+(v[2]-module["1^"][2]), string.sub(k, 2), color1, color2)
			end
		end
	end
end

function inputDisplayReg()
	
	for i = 1, 2 do
		if not inputs.properties.simpleinput.simpleinputxoffset[i] then
			inputs.properties.simpleinput.simpleinputxoffset[i] = module[i.."c"][1]
		end
	end
	
	for i = 1, 2 do
		if not inputs.properties.simpleinput.simpleinputyoffset[i] then
			inputs.properties.simpleinput.simpleinputyoffset[i] = module[i.."^"][2]
		end
	end

	displayfunc()
end

module = nil
for k,v in pairs(inp) do
	for j,u in ipairs(v[1]) do
		if emu.romname() == u or emu.parentname() == u or emu.sourcename() == u then
			module = v[2]
			for i,t in pairs(module) do
				t[3] = mame and t[4] or t[3]
			end
			return
		end
	end
end
generic()

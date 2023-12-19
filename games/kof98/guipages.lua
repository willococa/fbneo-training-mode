
assert(rb,"Run fbneo-training-mode.lua")

guicustompage = {
	title = {
		text = "The king of fighters 98 - Training Mode Settings",
		x = interactivegui.boxxlength/2 - (#"The king of fighters 98 - Training Mode Settings")*2,
		y = 1,
	},
	guielements.leftarrow,
	guielements.rightarrow,
	{
		text = "Toggle Guard",
		x = 8,
		y = 30,
		olcolour = "black",
		handle = 1,
		info = {
		},
		func =	function()
				dummy_guard = dummy_guard + 1
				if dummy_guard > 1 then
					dummy_guard = 0
				end
			end,
		autofunc = function(this)
				if dummy_guard == 0 then
					this.text = "Toggle Guard: Off"
				elseif dummy_guard == 1 then
					this.text = "Toggle Guard: On"
				end
			end,
	},
	{
		text = "Toggle Random Guard (works only if guard is on)",
		x = 8,
		y = 50,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
				dummy_random_guard = dummy_random_guard + 1
				if dummy_random_guard > 1 then
					dummy_random_guard = 0
				end
			end,
		autofunc = function(this)
				if dummy_random_guard == 0 then
					this.text = "Toggle Random Guard: Off"
				elseif dummy_random_guard == 1 then
					this.text = "Toggle Random Guard: On"
				end
			end,
	},
	{
		text = "Toggle Reversal",
		x = 8,
		y = 70,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
				dummy_reversal = dummy_reversal + 1
				if dummy_reversal > 1 then
					dummy_reversal = 0
				end
			end,
		autofunc = function(this)
				if dummy_reversal == 0 then
					this.text = "Toggle Reversal: Off"
				elseif dummy_reversal == 1 then
					this.text = "Toggle Reversal: On"
				end
			end,
	},
	{
		text = "Toggle Reversal Random",
		x = 8,
		y = 90,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
				dummy_reversal_random = dummy_reversal_random + 1
				if dummy_reversal_random > 1 then
					dummy_reversal_random = 0
				end
			end,
		autofunc = function(this)
				if dummy_reversal_random == 0 then
					this.text = "Toggle Reversal Random: Off"
				elseif dummy_reversal_random == 1 then
					this.text = "Toggle Reversal Random: On"
				end
			end,
	},
	----{
	-- See below for the character specific button
	----}
	{
			text = "Reversal Move Active Settings",
			x = 8,
			y = 110,
			olcolour = "black",
			handle = 8,
			func = 	function() CIG("reversal_move_active_settings", 1) end,
	},
	{
		text = "Current Reversal Move(s)",
		x = 8,
		y = 130,
		olcolour = "black",
		handle = 2,
		info = {
            "the first one is the default"
		},
		func =	function()
				
			end,
		autofunc = function(this)
            local txt = ""
            local i = 1
                for index, value in ipairs(dummy_reversal_moves) do
                    if i == 1 then
                        txt = txt..value
                        i = 1 + 1
                    else
                        txt = txt..", "..value
                    end
                end   
                this.text =  "Current Reversal Move(s): ("..txt..")"
			end,
	},
	{
		text = "Toggle Recovery",
		x = 8,
		y = 150,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
				dummy_recovery = dummy_recovery + 1
				if dummy_recovery > 1 then
					dummy_recovery = 0
				end
			end,
		autofunc = function(this)
				if dummy_recovery == 0 then
					this.text = "Toggle Recovery: Off"
				elseif dummy_recovery == 1 then
					this.text = "Toggle Recovery: On"
				end
			end,
	},
}
local reversal_move_active_settings = {
	title = {
		text = "Reversal Move Active Settings",
		x = interactivegui.boxxlength/2 - 40,
		y = 1,
	},
	{
		text = "<",
		olcolour = "black",
		info = "Back",
		func =  function() CIG(interactivegui.previouspage,1) end,
	},
}
guipages.reversal_move_active_settings = reversal_move_active_settings
------------------------------------------
-- Add-on
------------------------------------------
addonpage = {
	title = {
		text = "Add-On",
		x = interactivegui.boxxlength/2 - 10,
		y = 1,
	},
	{
		text = "<",
		olcolour = "black",
		info = "Back",
		func =  function() 
			interactivegui.page = 5
			interactivegui.selection = 1 
		end,
	},
}
guipages.addonpage = addonpage

addonbutton = {
		text = "Add-On",
		x = 210,
		y = 150,
		olcolour = "black",
		handle = 7,
		func = 	function() CIG("addonpage", 1) end,
		}

function insertAddonButton()
	if #addonpage > 1 then
		table.insert(guicustompage, addonbutton)
		formatGuiTables()
	end
end

function determineButtonYPos(_guipage)
	if #_guipage == 1 then 
		return 40
	else
		return _guipage[#_guipage].y+20
	end
end

--[[ REVERSAL MOVE ACTIVE SETTINGS  ]]

moves = {
	['DPC'] = {
		["sequence"] = {
			{'_'},
			{'_'},
			{'_'},
			{'_'},
			{'_'},
			{ 'forward'},
			{ 'forward'},
			{'_'},
			{'_'},
			{'down'},
			{'down'},
			{'down', 'forward','c'},
			{'down', 'forward','c'},
			{'c'},
			{'c'},
			{'c'}},
			times = 5
	},
	['DPA'] = {
		["sequence"] = {
			{'_'},
			{'_'},
			{ 'forward'},
			{ 'forward'},
			{'_'},
			{'_'},
			{'down'},
			{'down'},
			{'down', 'forward','a'},
			{'down', 'forward','a'},
			{'a'},
			{'a'},
			{'a'}},
			times = 13
	},
	['DOWN_C']={
		["sequence"] = {
			{'down'},
			{'down'},
			{'down', 'c'},
			{'down', 'c'},
		},
		times = 50
	},
	['GUARD']={
		["sequence"] = {
			{'back','down'},
			{'back','down'},
			{'back','down'},
			{'back','down'},
			{'back','down'},

		},
		times = 10
	},
	['THROW_C']={
		["sequence"] = {
			{'back'},
			{'back'},
			{'back'},
			{'back'},
			{'back', 'c'},
			{'back', 'c'},				
			{'back'},
			{'back'},
			{'back'},
			{'back'},
		},
		times = 10
	},
	['CD']={
		["sequence"] = {		
			{'_'},
			{'_'},
			{'c', 'd'} 
		},
		times = 10
	},
	['AB']={
		["sequence"] = {
			{'_'},
			{'_'},
			{'a', 'b'} 
		},
		times = 20
	},
	['FAB']={
		["sequence"] = {
			{'_'},		
			{'_'},		
			{'forward'},
			{'forward'},
			{'forward','a', 'b'},
			{'forward','a', 'b'},
			{'a', 'b'},
			{'a', 'b'},
		},
		times = 10
	},
}
local reversalmoveactivesettings = {}
local iterator = 1
moves_var_names = {}
for index, value in pairs(moves) do
   if index == "DPC" then
    moves_var_names[index] = 1
   else
    moves_var_names[index] = 0
   end
    reversalmoveactivesettings[index] = {
        text = "Enable "..index,
        x = 8,
        y = 10 + (iterator * 20),
        olcolour = "black",
        info = {
        },
        func =	function()
                 moves_var_names[index] = moves_var_names[index]  + 1
                if  moves_var_names[index]   > 1 then
                     moves_var_names[index]  = 0
                end
                dummy_reversal_moves = getCurrentReversalMoves()
            end,
        autofunc = function(this)
                if  moves_var_names[index]  == 0 then
                    this.text = "Disable "..index..": Off"
                elseif  moves_var_names[index]   == 1 then
                    this.text = "Disable "..index..": On"
                end
            end,
    }
   iterator = iterator+1 
table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[index])
end


function getCurrentReversalMoves()
	local tabl = {}
	for index, value in pairs(moves_var_names) do
		if moves_var_names[index] == 1 then
			table.insert(tabl, index)
		end
	end
	return tabl
end

dummy_reversal_moves = getCurrentReversalMoves()
print("settings: ")
print(dummy_reversal_moves)

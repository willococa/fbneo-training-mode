function printTable(table, indent)
    indent = indent or 0
    local indentStr = string.rep("  ", indent)

    if type(table) == "table" then
        print(indentStr .. "{")
        for key, value in pairs(table) do
            local keyStr = type(key) == "string" and '["' .. key .. '"]' or "[" .. tostring(key) .. "]"
            print(indentStr .. "  " .. keyStr .. " = " .. tostring(value) .. ",")
            if type(value) == "table" then
                printTable(value, indent + 1)
            end
        end
        print(indentStr .. "}")
    else
        print(indentStr .. tostring(table))
    end
end


	-- Define the structure and default values for the ReversalMove class
	local reversalMove_structure = {
		name = "Default Move",
		on_guard_times = 3,
		on_guard_delay = 0,
		on_wake_up_times = 1,
		on_wake_up_delay = 27,
	}



-- Constructor function to create an instance of the ReversalMove class with default values
	function createReversalMove(moveData)
		local reversalMoveInstance = {}
	
		-- Set default values
		for key, defaultValue in pairs(reversalMove_structure) do
			reversalMoveInstance[key] = defaultValue
		end
	
		-- Override with provided values
		for key, value in pairs(moveData) do
			reversalMoveInstance[key] = value
		end
	
		return reversalMoveInstance
	end
	

-- ReversalList Class
ReversalList = {}

-- Constructor function for ReversalList
	function ReversalList:new()
		local newObj = {}
		newObj.moves = {}  -- Initialize the moves field as an empty table
		setmetatable(newObj, self)
		self.__index = self
		return newObj
	end
	
function ReversalList:setReversals(moves)

	self.moves = {}  -- Clear existing moves

    for moveName, moveData in pairs(moves) do
        local reversalMove = createReversalMove({ name = moveName })
        self.moves[moveName] = reversalMove
    end
end

function ReversalList:getReversal(reversal_name)
    return self.moves[reversal_name]
end

function ReversalList:setReversal(reversal)
    local reversal_name = reversal.move_name
    self.moves[reversal_name] = createReversalMove(reversal)
end
--[[ REVERSAL MOVE ACTIVE SETTINGS  ]]

moves = {
	['DPC'] = {
		["sequence"] = {
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
		},
			times = 5,
			default = true
	},
	['DOWN_C']={
		["sequence"] = {
			{'down', 'forward'},
			{'down', 'forward'},
			{'down', 'forward', 'c'},
			{'down', 'forward', 'c'},
		},
		times = 13,
		default  = true
	},
	['STAND_A']={
		["sequence"] = {
			{'_'},		
			{'_'},		
			{'a'},
			{'a'},
		},
		times = 13
	},
	['C_GUARD']={
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
			{'a', 'b'}, 
			{'a', 'b'}, 
			{'a', 'b'}, 
			{'a', 'b'} 
		},
		times = 3
	},
	['MASH_CRB']={
		["sequence"] = {	
			{'down'},
			{'down'},
			{'down'},
			{'down'},
			{'down'},
			{'down'},
			{'down','b'},
			{'down', 'b'},
		},
		times = 17,
	},
}


local movelist = ReversalList:new()
movelist:setReversals(moves)
KOF_CONFIG.REVERSAL_MOVES.MOVELIST = movelist

local reversalmoveactivesettings = {}
local moves_var_names = {}
local elementsPerColumn = 4-- Elements per column
local xSpacing = 115 -- Spacing between columns
local xPosition = 8
local yPosition = 10
local iterator = 1
local elementsPerRow = 15
local rowGap = 40
for index, value in pairs(moves) do
	local baseIndex = ((iterator- 1) *elementsPerRow )+ 1
    if moves[index].default == true then
        moves_var_names[index] =  KOF_CONFIG.REVERSAL_MOVES.OPTIONS.BOTH
    else
        moves_var_names[index] =  KOF_CONFIG.REVERSAL_MOVES.OPTIONS.OFF
    end

    local column = math.floor((iterator - 1) / elementsPerColumn) + 1
    local columnElement = (iterator - 1) % elementsPerColumn + 1
    
    xPosition = 8 + (column - 1) * xSpacing
    
    if columnElement == 1 then
        yPosition = 10
    else
        yPosition = yPosition + rowGap
    end

	

    reversalmoveactivesettings[baseIndex] = {
        text = index,
        x = xPosition,
        y = yPosition,
        olcolour = "black",
        info = {},
        func = function()
				moves_var_names[index] = moves_var_names[index]+ 1
				if moves_var_names[index]> 3 then
					moves_var_names[index] = 0
				end
            	KOF_CONFIG.GUARD.reversal_moves = getCurrentGuardReversalMoves()
				KOF_CONFIG.WAKEUP.reversal_moves  = getCurrentWakeupReversalMoves()
        end,
        autofunc = function(this)
			
			if (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.OFF) then
				this.text = index .. ": Off" 
			elseif (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.GUARD) then
				this.text = index .. ": Guard" 
			elseif (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.WAKEUP)then
				this.text = index .. ": WakeUp" 
			elseif (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.BOTH)then
				this.text = index .. ": Both" 
			end
        end,
    }
	table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex])
	

	local current_reversal_move = KOF_CONFIG.REVERSAL_MOVES.MOVELIST:getReversal(index)

	--ELEMENTS OF THE CALIBRATION ROW  for guard
		-- First Element: "delay: "
		reversalmoveactivesettings[baseIndex * 2 ] = {
			text = "Guard:",
			x = xPosition,
			y = yPosition + 12,				
			olcolour = "black",
			info = { 
				"this is the delay it will take on frames and the times of the reversal on guard"
				
			 },
			func = function()
				-- Function for "delay: "
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2])
	
		-- Second Element: "(-) delay"
		reversalmoveactivesettings[baseIndex * 2  + 1] = {
			text = "-",
			x = xPosition + 34,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				-- Function for "(-) delay"				
				if current_reversal_move.on_guard_delay == 0 then
					return
				end
				current_reversal_move.on_guard_delay  = current_reversal_move.on_guard_delay - 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2  + 1])
		-- Third Element: "delay"
		reversalmoveactivesettings[baseIndex * 2 + 2] = {
			text = tostring(current_reversal_move.on_guard_delay),
			x = xPosition + 45,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				
			end,
			autofunc = function(this)
				this.text = tostring(current_reversal_move.on_guard_delay)
			end,
	
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 2])
		-- Fourth Element: "+ delay"
		reversalmoveactivesettings[baseIndex * 2 + 3] = {
			text = "+",
			x = xPosition + 60,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				-- Function for "(+) delay"
				current_reversal_move.on_guard_delay  = current_reversal_move.on_guard_delay + 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 3])
	
		-- fith Element: "(-) Times"
		reversalmoveactivesettings[baseIndex * 2 + 4] = {
			text = "-",
			x = xPosition + 75,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func =  function()
				-- Function for "(-) times"				
				if current_reversal_move.on_guard_times == 1 then
					return
				end
				current_reversal_move.on_guard_times  = current_reversal_move.on_guard_times - 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 4])
		-- sixth Element: "times"
		reversalmoveactivesettings[baseIndex * 2 + 5] = {
			text = tostring(current_reversal_move.on_guard_times),
			x = xPosition + 86,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				
			end,
			autofunc = function(this)
				this.text = tostring(current_reversal_move.on_guard_times)
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 5])
		-- Seventh Element: "+ times"
		reversalmoveactivesettings[baseIndex * 2 + 6] = {
			text = "+",
			x = xPosition + 99,  -- Adjust x position as needed
			y = yPosition + 12,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				current_reversal_move.on_guard_times  = current_reversal_move.on_guard_times + 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 6])
		--ELEMENTS OF THE CALIBRATION ROW  for Wake Up
			-- First Element: "delay: "
		reversalmoveactivesettings[baseIndex * 2 + 7 ] = {
			text = "WakeUp:",
			x = xPosition,
			y = yPosition + 24,				
			olcolour = "black",
			info = { 
				"this is the delay it will take on frames and the times of the reversal on guard"
				
			 },
			func = function()
				-- Function for "delay: "
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 7])
	
		-- Second Element: "(-) delay"
		reversalmoveactivesettings[baseIndex * 2  + 8] = {
			text = "-",
			x = xPosition + 34,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				-- Function for "(-) delay"				
				if current_reversal_move.on_wake_up_delay == 0 then
					return
				end
				current_reversal_move.on_wake_up_delay  = current_reversal_move.on_wake_up_delay - 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2  + 8])
		-- Third Element: "delay"
		reversalmoveactivesettings[baseIndex * 2 + 9] = {
			text = tostring(current_reversal_move.on_wake_up_delay),
			x = xPosition + 45,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				
			end,
			autofunc = function(this)
				this.text = tostring(current_reversal_move.on_wake_up_delay)
			end,
	
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 9])
		-- Fourth Element: "+ delay"
		reversalmoveactivesettings[baseIndex * 2 + 10] = {
			text = "+",
			x = xPosition + 60,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				-- Function for "(+) delay"
				current_reversal_move.on_wake_up_delay  = current_reversal_move.on_wake_up_delay + 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 10])
	
		-- fith Element: "(-) Times"
		reversalmoveactivesettings[baseIndex * 2 + 11] = {
			text = "-",
			x = xPosition + 75,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func =  function()
				-- Function for "(-) times"				
				if current_reversal_move.on_wake_up_times == 1 then
					return
				end
				current_reversal_move.on_wake_up_times  = current_reversal_move.on_wake_up_times - 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 11])
		-- sixth Element: "times"
		reversalmoveactivesettings[baseIndex * 2 + 12] = {
			text = tostring(current_reversal_move.on_wake_up_times),
			x = xPosition + 86,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				
			end,
			autofunc = function(this)
				this.text = tostring(current_reversal_move.on_wake_up_times)
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 12])
		-- Seventh Element: "+ times"
		reversalmoveactivesettings[baseIndex * 2 + 13] = {
			text = "+",
			x = xPosition + 99,  -- Adjust x position as needed
			y = yPosition + 24,  -- Keep the same y position
			olcolour = "black",
			info = {},
			func = function()
				current_reversal_move.on_wake_up_times  = current_reversal_move.on_wake_up_times + 1
			end,
		}
		table.insert(guipages.reversal_move_active_settings, reversalmoveactivesettings[baseIndex * 2 + 13])
	
    
    iterator = iterator + 1
end


function getCurrentGuardReversalMoves()
	local tabl = {}
	for index, value in pairs(moves_var_names) do
		if (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.GUARD) or moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.BOTH then
		
            local reversalMove = index
			table.insert(tabl, reversalMove)
		end
	end
	
	return tabl
end

 function getCurrentWakeupReversalMoves()
    local tabl = {}
    
    for index, value in pairs(moves_var_names) do
        if (moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.WAKEUP) or moves_var_names[index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.BOTH then
            
            local reversalMove = index
			table.insert(tabl, reversalMove)
		end
    end
    return tabl
end

KOF_CONFIG.GUARD.reversal_moves = getCurrentGuardReversalMoves()
KOF_CONFIG.WAKEUP.reversal_moves = getCurrentWakeupReversalMoves()



function loadReversalSettings()
	local wakeupreversalmovecalibratesettings = {}
	guipages.wake_up_reversal_move_calibration_settings  ={}
	local wake_up_reversal_move_calibration_settings ={
		title = {
			text = "Wake Up Reversal calibration Settings",
			x = interactivegui.boxxlength/2 - (#"Wake Up Reversal calibration Settings")*2,
			y = 1,
		},
		{
			text = "<<",
			olcolour = "black",
			info = "Back",
			func =  function() CIG(interactivegui.previouspage,1) end,
		},
	}
	guipages.wake_up_reversal_move_calibration_settings = wake_up_reversal_move_calibration_settings
	for index, reversalMove in ipairs(KOF_CONFIG.WAKEUP.reversal_moves) do
		local baseIndex = (index - 1) * 9 + 1
		local yValue = 10 + (index - 1) * 20

		-- Create the first element with the move name
		wakeupreversalmovecalibratesettings[index] = {
			text = "Calibrate Wake Up  " .. reversalMove .. ":",
			x = 8,
			y = yValue,
			olcolour = "black",
			info = {},
			handle =index,
			func = function()
				
			end,
			autofunc = function(this)
				this.text = "Calibrate Wake Up  " .. reversalMove.. ")"
			end,
		}
		table.insert(guipages.wake_up_reversal_move_calibration_settings, wakeupreversalmovecalibratesettings[index])
	end

end
loadReversalSettings()
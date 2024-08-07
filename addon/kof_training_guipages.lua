
KOF_CONFIG = {

	GUARD = {
		dummy_guarding = false,
		standing_guard = 0,
		crouch_guard = 0,
		random_guard = 0,
		reversal =0,
		REVERSAL_OPTIONS = {
			
			OFF = 0,
			ON = 1,
			RANDOM = 2
		},
		reversal_moves = {}
	},
    REVERSAL_MOVES = {
		OPTIONS = {
			OFF = 0,
			ON= 1,
		},
		MOVELIST = nil
	},
    WAKEUP = {
		dummy_waking_up = false,
		reversal  = 0,
		REVERSAL_OPTIONS = {
			
			OFF = 0,
			ON = 1,
			RANDOM = 2
		},
		reversal_moves = {}
	},
	RECOVERY = {
		dummy_recovering = false,
		recovery = 0,
		OPTIONS = {
			OFF = 0,
			ON = 1,
			RANDOM = 2,
		},
		delay = 10,
		times = 8
	},
	DIZZY ={
		dummy_can_dizzy = true,
		enabled = 1,
		OPTIONS = {
			OFF = 0,
			ON = 1,
		},

	},
	MOVES = {
		
		['GUARD_BACK']={
			["sequence"] = {
				{'back'},
	
			},
			times = 10
		},
		['AB']={
			["sequence"] = {
				{'-'},
				{'a','b'},
				{'a','b'},
				{'a','b'},
	
			},
			times = 3,
			delay = 25
		},
		["CROUCH"] = {
			["sequence"] = {
			{"down"},
			}
		},
		["CROUCH_GUARD"] = {
			["sequence"] = {
			{"down", "back"}
			},
			times = 10
		}
	},
	MOVES_VAR_NAMES = {
		GUARD={},
		WAKEUP={},
	},
	TRAINING ={
		current_configuration = -1,
		CONFIGURATIONS =  {
			["None"] = -1,
			["cd_pressure_1"] = 0,
			["cd_pressure_2"] = 1,
			["cd_pressure_3"] = 2,
			["cd_pressure_4"] = 3,
			["crouching_frametrap"] = 4,
			["standing_frametrap"] = 5,
			["high_confirm_against_CDA"] = 6,
			["wakeup_whiff_cr_c"] = 7,
			["wakeup_dpc"] = 8,
			["shimmy_wakeup"] = 9,
			["wakeup_delay_OS_basic"] = 10,
			["wakeup_delay_OS_full"] = 11,
			
		}
	}
}



guicustompage = {
	title = {
		text = "The king of fighters - Training Mode Settings",
		x = interactivegui.boxxlength/2 - (#"The king of fighters - Training Mode Settings")*2,
		y = 1,
	},
	guielements.leftarrow,
	guielements.rightarrow,
	{
		text = "Guard Settings: ",
		x = 2,
		y = 15,
	},
	{
		text = "Stand Guard",
		x = 118,
		y = 25,
		olcolour = "black",
		handle = 1,
		info = {
		},
		func =	function()
				KOF_CONFIG.GUARD.standing_guard = KOF_CONFIG.GUARD.standing_guard + 1
				if KOF_CONFIG.GUARD.standing_guard > 1 then
					KOF_CONFIG.GUARD.standing_guard = 0
					KOF_CONFIG.GUARD.dummy_guarding = false
				end
				if KOF_CONFIG.GUARD.standing_guard == 1 then
					KOF_CONFIG.GUARD.dummy_guarding = true
                    KOF_CONFIG.GUARD.crouch_guard = 0
				end
			end,
		autofunc = function(this)
				if KOF_CONFIG.GUARD.standing_guard == 0 then
					this.text = "Toggle Stand Guard: Off"
				elseif KOF_CONFIG.GUARD.standing_guard == 1 then
					this.text = "Toggle Stand Guard: On"
				end
			end,
	},
	{
		text = "Toggle Crouch Guard",
		x = 8,
		y = 25,
		olcolour = "black",
		handle = 1,
		info = {
		},
		func =	function()
				KOF_CONFIG.GUARD.crouch_guard = KOF_CONFIG.GUARD.crouch_guard + 1
				if KOF_CONFIG.GUARD.crouch_guard > 1 then
					KOF_CONFIG.GUARD.crouch_guard = 0
					KOF_CONFIG.GUARD.dummy_guarding = false

				end
				if KOF_CONFIG.GUARD.crouch_guard == 1 then
					KOF_CONFIG.GUARD.dummy_guarding = true
                    KOF_CONFIG.GUARD.standing_guard = 0
				end
			end,
		autofunc = function(this)
				if KOF_CONFIG.GUARD.crouch_guard == 0 then
					this.text = "Toggle Crouch Guard: Off"
				elseif KOF_CONFIG.GUARD.crouch_guard == 1 then
					this.text = "Toggle Crouch Guard: On"
				end
			end,
	},
	{
		text = "Toggle Random Guard (works only if guard is on)",
		x = 8,
		y = 35,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
                if(not(KOF_CONFIG.GUARD.dummy_guarding) ) then              
                    return 
                end

				KOF_CONFIG.GUARD.random_guard = KOF_CONFIG.GUARD.random_guard + 1
				if KOF_CONFIG.GUARD.random_guard > 1 then
					KOF_CONFIG.GUARD.random_guard = 0
				end
			end,
		autofunc = function(this)
            if(not(KOF_CONFIG.GUARD.dummy_guarding) ) then              
                KOF_CONFIG.GUARD.random_guard =0
            end
				if KOF_CONFIG.GUARD.random_guard == 0 then
					this.text = "Toggle Random Guard: Off"
				elseif KOF_CONFIG.GUARD.random_guard == 1 then
					this.text = "Toggle Random Guard: On"
				end
			end,
	},
	{
		text = "Toggle Guard Reversal",
		x = 118,
		y = 35,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
				KOF_CONFIG.GUARD.reversal = KOF_CONFIG.GUARD.reversal + 1
				if KOF_CONFIG.GUARD.reversal > 2 then
					KOF_CONFIG.GUARD.reversal = 0
				end
			end,
		autofunc = function(this)				
					if (KOF_CONFIG.GUARD.reversal  == KOF_CONFIG.GUARD.REVERSAL_OPTIONS.OFF) then
						this.text = "Enable G. Reversal: Off" 
					elseif (KOF_CONFIG.GUARD.reversal  == KOF_CONFIG.GUARD.REVERSAL_OPTIONS.ON) then
						this.text = "Enable G. Reversal: On" 
					elseif (KOF_CONFIG.GUARD.reversal  == KOF_CONFIG.GUARD.REVERSAL_OPTIONS.RANDOM ) then
						this.text = "Enable G. Reversal: Random"
					end
			end,
	},
	{
		text = "Other Settings: ",
		x = 2,
		y = 50,
	},
	{
		text = "WakeUp Reversal",
		x = 8,
		y = 60,
		olcolour = "black",
		handle = 2,
		info = {
		},
		func =	function()
					if next(KOF_CONFIG.WAKEUP.reversal_moves) == nil then
						return
					end
					KOF_CONFIG.WAKEUP.reversal= KOF_CONFIG.WAKEUP.reversal+ 1
					if KOF_CONFIG.WAKEUP.reversal> 2 then
						KOF_CONFIG.WAKEUP.reversal= 0
					end
					if KOF_CONFIG.WAKEUP.reversal ~= KOF_CONFIG.WAKEUP.REVERSAL_OPTIONS.OFF then
						KOF_CONFIG.WAKEUP.dummy_waking_up = true
					else KOF_CONFIG.WAKEUP.dummy_waking_up = false end
				end,
		autofunc = function(this)				
					if (KOF_CONFIG.WAKEUP.reversal == KOF_CONFIG.WAKEUP.REVERSAL_OPTIONS.OFF) then
						this.text = "Wake Up Reversal: Off" 
					elseif (KOF_CONFIG.WAKEUP.reversal == KOF_CONFIG.WAKEUP.REVERSAL_OPTIONS.ON) then
						this.text = "Wake Up Reversal: On" 
					elseif (KOF_CONFIG.WAKEUP.reversal == KOF_CONFIG.WAKEUP.REVERSAL_OPTIONS.RANDOM ) then
						this.text = "Wake Up Reversal: Random"
					end
			end,
	},
	{
		text = "Enable Tech Recovery",
		x = 118,
		y = 60,
		olcolour = "black",
		handle = 2,
		info = {
			"Controls how many frames until the character takes to do the reversal",
			"Because depending on the mo "
		},
		func =	function()
					KOF_CONFIG.RECOVERY.recovery= KOF_CONFIG.RECOVERY.recovery+ 1
					if KOF_CONFIG.RECOVERY.recovery> 2 then
						KOF_CONFIG.RECOVERY.recovery= 0
					end
					if KOF_CONFIG.RECOVERY.recovery ~= KOF_CONFIG.RECOVERY.OPTIONS.OFF then
						KOF_CONFIG.RECOVERY.dummy_recovering = true
					else 
						KOF_CONFIG.RECOVERY.dummy_recovering = false
					end
				end,
		autofunc = function(this)				
					if KOF_CONFIG.RECOVERY.recovery == KOF_CONFIG.RECOVERY.OPTIONS.OFF  then
						this.text = "Tech Recovery: Off" 
					elseif KOF_CONFIG.RECOVERY.recovery == KOF_CONFIG.RECOVERY.OPTIONS.ON  then
						this.text = "Tech Recovery: On"  
					elseif KOF_CONFIG.RECOVERY.recovery == KOF_CONFIG.RECOVERY.OPTIONS.RANDOM then
						this.text = "Tech Recovery: Random" 
					end
			end,
	}, {
		text = "Recovery Delay:",
		x = 8,
		y = 70,				
		olcolour = "black",
		info = { 
			"this is the delay it will take on frames and the times of the recovery"
			
		 },
	}, {
		text = "-",
		x = 40 + 34,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			-- Function for "(-) delay"				
			if KOF_CONFIG.RECOVERY.delay == 0 then
				return
			end
			KOF_CONFIG.RECOVERY.delay  = KOF_CONFIG.RECOVERY.delay - 1
		end,
	},{
		text = tostring(KOF_CONFIG.RECOVERY.delay),
		x = 40 + 45,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			
		end,
		autofunc = function(this)
			this.text = tostring(KOF_CONFIG.RECOVERY.delay)
		end,

	}, {
		text = "+",
		x = 40+ 60,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			-- Function for "(+) delay"
			KOF_CONFIG.RECOVERY.delay  = KOF_CONFIG.RECOVERY.delay + 1
		end,
	},{
		text = "Recovery Times:",
		x = 118,
		y = 70,				
		olcolour = "black",
		info = { 
			"this is the delay it will take on frames and the times of the recovery"
			
		 },
	}, {
		text = "-",
		x = 150 + 34,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			-- Function for "(-) delay"				
			if KOF_CONFIG.RECOVERY.times == 1 then
				return
			end
			KOF_CONFIG.RECOVERY.times  = KOF_CONFIG.RECOVERY.times - 1
		end,
	},{
		text = tostring(KOF_CONFIG.RECOVERY.times),
		x = 150 + 45,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			
		end,
		autofunc = function(this)
			this.text = tostring(KOF_CONFIG.RECOVERY.times)
		end,

	}, {
		text = "+",
		x = 150+ 60,  -- Adjust x position as needed
		y = 70,  -- Keep the same y position
		olcolour = "black",
		info = {},
		func = function()
			-- Function for "(+) delay"
			KOF_CONFIG.RECOVERY.times  = KOF_CONFIG.RECOVERY.times + 1
		end,
	},
	{
		text = "Reversal Move List Settings and information: ",
		x = 2,
		y = 75 + 10,
	},
	{
			text = "Dissy enabled",
			x = 110+8,
			y = 85  +10,
			olcolour = "black",
			handle = 8,
			func =	function()
				KOF_CONFIG.DIZZY.enabled  = KOF_CONFIG.DIZZY.enabled + 1
						if KOF_CONFIG.DIZZY.enabled> 1 then
							KOF_CONFIG.DIZZY.enabled= 0
						end
						if KOF_CONFIG.DIZZY.enabled ~= KOF_CONFIG.DIZZY.OPTIONS.OFF then
							KOF_CONFIG.DIZZY.dummy_can_dizzy = true
						else 
							KOF_CONFIG.DIZZY.dummy_can_dizzy= false
						end
					end,
			autofunc = function(this)				
						if KOF_CONFIG.DIZZY.enabled == KOF_CONFIG.DIZZY.OPTIONS.OFF  then
							this.text = "DIZZY: Off" 
						elseif KOF_CONFIG.DIZZY.enabled == KOF_CONFIG.DIZZY.OPTIONS.ON  then
							this.text = "DIZZY: On" 
						end
				end,
	},{
		text = "Guard Reversals",
		x = 8,
		y = 85  +10,
		olcolour = "black",
		handle = 9,
		func = 	function() CIG("guard_reversal_move_active_settings", 1) end,
	},
	{
		text = "()",
		x = 8,
		y = 95 + 10,
		olcolour = "black",
		handle = 2,
		info = {
            "active moves for reversal on guard"
		},
		func = 	function()
		end,
		autofunc = function(this)
            local txt = ""
            local i = 1
                for index, value in ipairs(KOF_CONFIG.GUARD.reversal_moves) do
                    if i == 1 then
                        txt = txt..value
                        i = 1 + 1
                    else
                        txt = txt..", "..value
                    end
                end   
                this.text =  "("..txt..")"
			end,
	},{
		text = "WakeUp Reversals",
		x = 8,
		y = 105 + 10,
		handle = 9,
		func = 	function() CIG("wakeup_reversal_move_active_settings", 1) end,
	},
	{
		text = "()",
		x = 8,
		y = 115 + 10,
		olcolour = "black",
		handle = 8,
		func = 	function()
		end,
		autofunc = function(this)
            local txt = ""
            local i = 1
                for index, value in ipairs(KOF_CONFIG.WAKEUP.reversal_moves) do
                    if i == 1 then
                        txt = txt..value
                        i = 1 + 1
                    else
                        txt = txt..", "..value
                    end
                end   
                this.text =  "("..txt..")"
			end,
	},{
		text = "Configurations: ",
		x = 8,
		y = 125 + 10,
	},
	{
		text = "Current Conf: ",
		x = 8,
		y = 135 + 10,
		olcolour = "black",
		handle = 2,
		info = {
            "active moves for reversal on guard"
		},
		func = 	function()
			KOF_CONFIG.TRAINING.current_configuration = KOF_CONFIG.TRAINING.current_configuration + 1
				if KOF_CONFIG.TRAINING.current_configuration > 11 then
					KOF_CONFIG.TRAINING.current_configuration = -1
				end
				setDefaultConfig(KOF_CONFIG.TRAINING.current_configuration)
		end,
		autofunc = function(this) 
                this.text =  "Current Conf: "..getIndexFromConfigValue(KOF_CONFIG.TRAINING.current_configuration)
			end,
	},
}
local guard_reversal_move_active_settings = {
	title = {
		text = "Guard Reversal Move Active Settings",
		x = interactivegui.boxxlength/2 - 40,
		y = 1,
	},
	{
		text = "<",
		olcolour = "black",
		info = "Back",
		func =  function() CIG(0,1) end,
	},
}


guipages.guard_reversal_move_active_settings = guard_reversal_move_active_settings
local wakeup_reversal_move_active_settings = {
	title = {
		text = "Wake UP Reversal Move Active Settings",
		x = interactivegui.boxxlength/2 - 40,
		y = 1,
	},
	{
		text = "<",
		olcolour = "black",
		info = "Back",
		func =  function() CIG(0,1) end,
	},
}


guipages.wakeup_reversal_move_active_settings = wakeup_reversal_move_active_settings

function trace_line(event, line)
    if event == "call" then
        local info = debug.getinfo(2, "Sl")
        print("Calling function at line:", info.currentline)
    elseif event == "line" then
        print("Executing line:", line)
    end
end


local frame_data = {}

local rb, rbs, rw, rws, rd = memory.readbyte, memory.readbytesigned, memory.readword, memory.readwordsigned,
    memory.readdword

-- Constants derived from kof-hitboxes.lua (KOF98 profile)
local P1_BASE_ADDR = 0x108100
local P2_BASE_ADDR = 0x108300
local P1_OBJ_PTR_LIST = 0x10BF24 -- game_phase(0x10B094) + 0xE90
local OFFSET_STATUS = 0x7C

-- Hitbox Offsets
local BOX_OFFSETS = {
    0x90, 0x95, 0x9A, 0x9F
}

-- Box Types (11-42 are Attack types based on kof-hitboxes.lua)
-- We only care if it IS an attack
local function is_attack_type(id)
    return (id >= 11 and id <= 42)
end

-- State Enum
local STATE = {
    IDLE = 1,
    STARTUP = 2,
    ACTIVE = 3,
    RECOVERY = 4
}

local current_state = STATE.IDLE
local active_frames = 0
local startup_frames = 0
local recovery_frames = 0
local total_frames = 0
local last_active_frames = 0 -- To hold the value for display
local last_startup_frames = 0
local last_recovery_frames = 0

local p1_was_attacking = false

local function get_p1_base()
    return P1_BASE_ADDR
end

local function check_attack_box(base_addr)
    -- Check standard hitbox slots
    for _, offset in ipairs(BOX_OFFSETS) do
        local box_addr = base_addr + offset
        local box_id = rb(box_addr)
        if box_id ~= 0 and is_attack_type(box_id) then
            return true
        end
    end
    return false
end

-- Heuristic to detect if a move is happening at all
-- For now, we assume "Not Idle" if status is not 0?
-- Actually, let's just trigger on Cycle: Idle -> AttackBox -> NoAttackBox -> Idle
-- But we need to know when "Startup" begins.
-- A simple way is to check if the character is in a "non-neutral" action state.
-- But without a clean "Status" enum, we might rely on:
-- Startup = Time between "Input/Move Start" and "Active".
-- For this V1, let's measure "Active" accurately first.
-- Startup and Recovery are harder without reading specific animation timers or status flags.
-- kof-hitboxes reads "status" at +0x7C. Let's monitor that.
local function get_p1_status()
    return rb(get_p1_base() + OFFSET_STATUS)
end

function frame_data.init()
    current_state = STATE.IDLE
end

function frame_data.update()
    local p1_base = get_p1_base()
    local is_attacking = check_attack_box(p1_base)

    -- State Machine
    if is_attacking then
        if current_state ~= STATE.ACTIVE then
            -- Transition to ACTIVE
            -- If we were in STARTUP, we freeze that number.
            -- If we were IDLE, startup is 0 (immediate).
            current_state = STATE.ACTIVE
            active_frames = 0 -- Reset active counter
            if last_startup_frames == 0 and startup_frames > 0 then
                last_startup_frames = startup_frames
            end
        end

        active_frames = active_frames + 1
        recovery_frames = 0 -- Reset recovery while active
    else
        -- Not attacking
        if current_state == STATE.ACTIVE then
            -- Just finished Attacking -> RECOVERY
            current_state = STATE.RECOVERY
            last_active_frames = active_frames
            recovery_frames = 0
        elseif current_state == STATE.RECOVERY then
            recovery_frames = recovery_frames + 1
            -- How do we know when Recovery ends?
            -- Usually when status returns to neutral/standing/crouching (0/1/etc?)
            -- Or if we can move again.
            -- For now, let's just count up until the next move or arbitrary timeout?
            -- Better: Check specific status values if known.
            -- Fallback: If status indicates "neutral", go to IDLE.
            local status = get_p1_status()
            -- In many games, specific status bits indicate "busy".
            -- status 0 is often neutral.
            -- Let's trace status in the UI to learn.
        elseif current_state == STATE.IDLE then
            -- Check for STARTUP
            -- If status changes from Neutral to something else?
            -- For V1, we might count StartUp as "Frames since last Idle but before Active".
            local status = get_p1_status()
            -- Assume status != 0 means doing something?
            -- This is a guess. We will check status in OSD.
            if status ~= 0 and status ~= 255 then -- 255 often dummy/init
                -- Potentially startup
                -- But walking is also status!=0 probably.
                -- Let's just track Active for now strictly.
            end
        end
    end

    -- Since identifying Startup/Recovery strictly without move data index is hard,
    -- We will focus on accurately displaying ACTIVE FRAMES for now,
    -- and dump the 'Status' byte to screen so the user (and we) can learn what Idle is.
end

function frame_data.draw()
    gui.text(10, 60, "Frame Data Info:")
    gui.text(10, 70, "State: " .. (current_state == STATE.ACTIVE and "ACTIVE" or "OTHER"))
    gui.text(10, 80, "Active Frames: " .. last_active_frames .. (current_state == STATE.ACTIVE and " (+)" or ""))

    -- Debug info
    local status = get_p1_status()
    gui.text(10, 100, "P1 Status Byte: " .. status)
end

return frame_data

KOF_CONFIG = {
    GAMES = {
        ["kof98"] = {
            name = "The King of Fighters '98",
            player1_base = 0x108100,
            player2_base = 0x108300,
            offsets = {
                hitstatus = 0x72,
                action = 0x73,
                status = 0x7C,
                blockstun = 0xE3,
                air_height = 0x21,
                player_stored_index = 0x274E, -- Memory delta: p1 is 0x10A84E, relative to base 0x108100 = 0x274E
                obj_ptr_list = 0x10B094 + 0xE90,
                game_phase = 0x10B094,
            },
            characters = {
                [1] = { name = "Kyo Kusanagi", code = "0x00", short_name = "kyo", has_ex = true },
                [2] = { name = "Benimaru Nikaido", code = "0x01", short_name = "beni" },
                [3] = { name = "Goro Daimon", code = "0x02", short_name = "goro" },
                [4] = { name = "Terry Bogard", code = "0x03", short_name = "terry", has_ex = true },
                [5] = { name = "Andy Bogard", code = "0x04", short_name = "andy", has_ex = true },
                [6] = { name = "Joe Higashi", code = "0x05", short_name = "joe", has_ex = true },
                [7] = { name = "Ryo Sakazaki", code = "0x06", short_name = "ryo", has_ex = true },
                [8] = { name = "Robert Garcia", code = "0x07", short_name = "robert", has_ex = true },
                [9] = { name = "Yuri Sakazaki", code = "0x08", short_name = "yuri", has_ex = true },
                [10] = { name = "Leona", code = "0x09", short_name = "leona" },
                [11] = { name = "Ralf Jones", code = "0x0A", short_name = "ralf" },
                [12] = { name = "Clark Steel", code = "0x0B", short_name = "clark" },
                [13] = { name = "Athena Asamiya", code = "0x0C", short_name = "athena" },
                [14] = { name = "Sie Kensou", code = "0x0D", short_name = "sie" },
                [15] = { name = "Chin Gentsai", code = "0x0E", short_name = "chin" },
                [16] = { name = "Chizuru Kagura", code = "0x0F", short_name = "chizuru" },
                [17] = { name = "Mai Shiranui", code = "0x10", short_name = "mai", has_ex = true },
                [18] = { name = "King", code = "0x11", short_name = "king" },
                [19] = { name = "Kim Kaphwan", code = "0x12", short_name = "kim" },
                [20] = { name = "Chang Koehan", code = "0x13", short_name = "chang" },
                [21] = { name = "Choi Bounge", code = "0x14", short_name = "choi" },
                [22] = { name = "Yashiro Nanakase", code = "0x15", short_name = "yashiro", has_ex = true },
                [23] = { name = "Shermie", code = "0x16", short_name = "shermie", has_ex = true },
                [24] = { name = "Chris", code = "0x17", short_name = "chris", has_ex = true },
                [25] = { name = "Ryuji Yamazaki", code = "0x18", short_name = "ryuji" },
                [26] = { name = "Blue Mary", code = "0x19", short_name = "mary" },
                [27] = { name = "Billy Kane", code = "0x1A", short_name = "billy", has_ex = true },
                [28] = { name = "Iori Yagami", code = "0x1B", short_name = "iori" },
                [29] = { name = "Mature", code = "0x1C", short_name = "mature" },
                [30] = { name = "Vice", code = "0x1D", short_name = "vice" },
                [31] = { name = "Heidern", code = "0x1E", short_name = "heidern" },
                [32] = { name = "Takuma Sakazaki", code = "0x1F", short_name = "takuma" },
                [33] = { name = "Saisyu Kusanagi", code = "0x20", short_name = "saisyu" },
                [34] = { name = "Heavy D!", code = "0x21", short_name = "heavy" },
                [35] = { name = "Lucky Glauber", code = "0x22", short_name = "lucky" },
                [36] = { name = "Brian Battler", code = "0x23", short_name = "brian" },
                [37] = { name = "Rugal Bernstein", code = "0x24", short_name = "rugal", has_ex = true },
                [38] = { name = "Shingo Yabuki", code = "0x25", short_name = "shingo" },
            }
        },
        ["kof97"] = {
            name = "The King of Fighters '97",
            player1_base = 0x108100,
            player2_base = 0x108300,
            offsets = {
                hitstatus = 0x72,
                action = 0x73,
                status = 0x7C,
                blockstun = 0xE3,
                air_height = 0x21,
                player_stored_index = 0x274E, -- Need to verify
                obj_ptr_list = 0x10B092 + 0xE90,
                game_phase = 0x10B092,
            },
            characters = {
                [1] = { name = "Kyo Kusanagi", code = "0x00", short_name = "kyo", has_ex = true },
                [2] = { name = "Benimaru Nikaido", code = "0x01", short_name = "beni" },
                [3] = { name = "Goro Daimon", code = "0x02", short_name = "goro" },
                [4] = { name = "Terry Bogard", code = "0x03", short_name = "terry", has_ex = true },
                [5] = { name = "Andy Bogard", code = "0x04", short_name = "andy", has_ex = true },
                [6] = { name = "Joe Higashi", code = "0x05", short_name = "joe", has_ex = true },
                [7] = { name = "Ryo Sakazaki", code = "0x06", short_name = "ryo", has_ex = true },
                [8] = { name = "Robert Garcia", code = "0x07", short_name = "robert", has_ex = true },
                [9] = { name = "Yuri Sakazaki", code = "0x08", short_name = "yuri", has_ex = true },
                [10] = { name = "Leona", code = "0x09", short_name = "leona" },
                [11] = { name = "Ralf Jones", code = "0x0A", short_name = "ralf" },
                [12] = { name = "Clark Steel", code = "0x0B", short_name = "clark" },
                [13] = { name = "Athena Asamiya", code = "0x0C", short_name = "athena" },
                [14] = { name = "Sie Kensou", code = "0x0D", short_name = "sie" },
                [15] = { name = "Chin Gentsai", code = "0x0E", short_name = "chin" },
                [16] = { name = "Chizuru Kagura", code = "0x0F", short_name = "chizuru" },
                [17] = { name = "Mai Shiranui", code = "0x10", short_name = "mai", has_ex = true },
                [18] = { name = "King", code = "0x11", short_name = "king" },
                [19] = { name = "Kim Kaphwan", code = "0x12", short_name = "kim" },
                [20] = { name = "Chang Koehan", code = "0x13", short_name = "chang" },
                [21] = { name = "Choi Bounge", code = "0x14", short_name = "choi" },
                [22] = { name = "Yashiro Nanakase", code = "0x15", short_name = "yashiro", has_ex = true },
                [23] = { name = "Shermie", code = "0x16", short_name = "shermie", has_ex = true },
                [24] = { name = "Chris", code = "0x17", short_name = "chris", has_ex = true },
                [25] = { name = "Ryuji Yamazaki", code = "0x18", short_name = "ryuji" },
                [26] = { name = "Blue Mary", code = "0x19", short_name = "mary" },
                [27] = { name = "Billy Kane", code = "0x1A", short_name = "billy", has_ex = true },
                [28] = { name = "Iori Yagami", code = "0x1B", short_name = "iori" },
                [29] = { name = "Shingo Yabuki", code = "0x1C", short_name = "shingo" },
                [30] = { name = "Orochi Iori", code = "0x1D", short_name = "o_iori", has_ex = true },
                [31] = { name = "Orochi Leona", code = "0x1E", short_name = "o_leona", has_ex = true },
                [32] = { name = "Orochi Yashiro", code = "0x1F", short_name = "o_yashiro" },
                [33] = { name = "Orochi Shermie", code = "0x20", short_name = "o_shermie" },
                [34] = { name = "Orochi Chris", code = "0x21", short_name = "o_chris" },
                [35] = { name = "Orochi", code = "0x22", short_name = "orochi" },
            }
        },
    },
    SUPPORTED_GAMES = {
        ["kof98"] = true,
        ["kof98h"] = true,
        ["kof97"] = true,
    },

    GUARD = {
        dummy_guarding = false,
        guard_mode = 0, -- 0: OFF, 1: ON, 2: RANDOM, 3: ALL GUARD, 4: 1 HIT GUARD
        MODE_OPTIONS = {
            OFF = 0,
            ON = 1,
            RANDOM = 2,
            ALL_GUARD = 3,
            ONE_HIT_GUARD = 4,
        },
        dummy_action = 0, -- 0: STANDING, 1: CROUCHING
        -- Deprecated: standing_guard, crouch_guard, random_guard
        ACTION_OPTIONS = {
            STANDING = 0,
            CROUCHING = 1,
        },
        reversal = 0,
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
            ON = 1,
        },

        getCurrentReversalMoves = function(type)
            local tabl = {}

            for index, value in pairs(KOF_CONFIG.MOVES_VAR_NAMES[type]) do
                if (KOF_CONFIG.MOVES_VAR_NAMES[type][index] == KOF_CONFIG.REVERSAL_MOVES.OPTIONS.ON) then
                    local reversalMove = index
                    table.insert(tabl, reversalMove)
                end
            end

            return tabl
        end
        ,
        MOVELIST = nil
    },
    WAKEUP = {
        dummy_waking_up  = false,
        reversal         = 0,
        REVERSAL_OPTIONS = {

            OFF = 0,
            ON = 1,
            RANDOM = 2
        },
        reversal_moves   = {}
    },
    HIT = {
        dummy_hit_reversal = false,
        reversal = 0,
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
    DIZZY = {
        dummy_can_dizzy = true,
        enabled = 1,
        OPTIONS = {
            OFF = 0,
            ON = 1,
        },

    },
    PLAYERS = {
        PLAYER1 = {
            ID = 1,
            NAME = "P1",
            CROUCH_GUARD = {
                can_crouch_guard = false,
                ENABLED = 0,
                OPTIONS = {
                    OFF = 0,
                    ON = 1,
                }
            },

        },
        PLAYER2 = {
            ID = 2,
            NAME = "P2",
            COUNTER = {
                can_be_countered = false,
                ENABLED = 0,
                OPTIONS = {
                    OFF = 0,
                    ON = 1,
                }
            },
            GUARD_BREAK = {
                state_toggled = false,
                STATE = 0,
                OPTIONS = {
                    NORMAL = 0,
                    NEVER = 1,
                    ALWAYS = 2
                }
            },

        },


    },
    CPU = {
        HAS_CHANGED = false,
        dummy_can_fight = false,
        current_dificulty = 0,
        DIFFICULTY = {
            ["BEGINNER"] = 0,
            ["EASY"] = 1,
            ["NORMAL"] = 2,
            ["MVS"] = 3,
            ["HARD"] = 4,
            ["VERYHARD"] = 5,
            ["HARDEST"] = 6,
            ["EXPERT"] = 7

        },
        getDifficultyString = function(self, value)
            for key, val in pairs(self.DIFFICULTY) do
                if val == value then
                    return tostring(val + 1) .. "-" .. key
                end
            end
            return nil
        end,
        vs_enabled = 0,
        OPTIONS = {
            OFF = 0,
            ON = 1,
        },
        GCCD = {
            dummy_can_gccd = false,
            current_gccd = 0,
            OPTIONS = {
                OFF = 0,
                ON = 1,
                RANDOM = 2,
            },

        },
        GCAB = {
            dummy_can_gcab = false,
            current_gcab = 0,
            OPTIONS = {
                OFF = 0,
                ON = 1,
                RANDOM = 2,
            },

        },
    },
    THROW_OS_ON_JUMP = false,
    MOVES = {

        ['GUARD_BACK'] = {
            ["sequence"] = {
                { 'back' },

            },
            times = 10
        },
        ['THROW_OS'] = {
            ["sequence"] = {
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'back', 'c' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },
                { 'down', 'back' },

            },
            times = 1
        },
        ['AB'] = {
            ["sequence"] = {
                { '-' },
                { 'a', 'b' },
                { 'a', 'b' },

            },
            times = 3,
            delay = 25
        },
        ['CD'] = {
            ["sequence"] = {
                { '-' },
                { 'c', 'd' },
                { 'c', 'd' },
                { 'c', 'd' },

            },
            times = 3,
            delay = 25
        },
        ["CROUCH"] = {
            ["sequence"] = {
                { "down" },
            }
        },
        ["CROUCH_GUARD"] = {
            ["sequence"] = {
                { "down", "back" }
            },
            times = 10
        }
    },
    MOVES_VAR_NAMES = {
        GUARD = {},
        WAKEUP = {},
        HIT = {},
    },
    TRAINING = {
        current_configuration = -1,
        CONFIGURATIONS = {
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
    },

    -- Dynamic Game Mapping functions
    get_current_game = function()
        local rname = emu.romname and emu.romname() or "kof98"
        return KOF_CONFIG.GAMES[rname] or KOF_CONFIG.GAMES["kof98"]
    end,

    UI = {
        CURRENT_PLAYER1 = {},
        CURRENT_PLAYER2 = {},
        PLAYER1_EX = false,
        PLAYER2_EX = false,
        CHARACTERS_HAS_CHANGED = true,
        current_stage_selected = 1,
        curent_background_music_selected = 1,
        MODE_HAS_CHANGED = false,
        PLAYER1_MODE = 1,
        PLAYER2_MODE = 1,
        MODES = {
            EXTRA = 0,
            ADVANCED = 1,
        },
        APPLIED = {
            PLAYER1 = nil,
            PLAYER2 = nil,
            PLAYER1_EX = false,
            PLAYER2_EX = false,
            PLAYER1_MODE = 1,
            PLAYER2_MODE = 1,
        }
    },
    DEBUG = {
        OPTIONS = {
            OFF = 0,
            ON = 1,
        },
        BLOCK = 0,
        ADVANTAGE = 0,
        ACTION = 0,
        POSITION = 0,
        STUN = 0,
        GUARD = 0,
        DISTANCE = 0,
        STATE = 0,
        METER = 0,
        FRAMEDATA = 0,
    }

}
KOF_CONFIG.UI.CURRENT_PLAYER1 = KOF_CONFIG.get_current_game().characters[1]
KOF_CONFIG.UI.CURRENT_PLAYER2 = KOF_CONFIG.get_current_game().characters[28]

--[[
        ███████ ████████ ███████  █████  ██  ██████████  ██   ██       ███  ████████ ██████  
        ██         ██    ██      ██   ██ ██      ██      ██   ██      █   █    ██    ██   ██ 
        ███████    ██    █████   ███████ ██      ██      ███████     ███████   ██    ██████  
             ██    ██    ██      ██   ██ ██      ██      ██   ██     ██   ██   ██    ██   ██ 
        ███████    ██    ███████ ██   ██ ███████ ██      ██   ██      █████    ██    ██   ██                                                   
]]--

OTR = {}

-- General Settings
OTR.Enabled = true -- Enable or disable the watermark
OTR.UpdateInterval = 1000 -- in milliseconds  (150ms is optimized without sacrificing the looks of the RGB shift)

-- Text Settings
OTR.Text = "{servername} | Players: {players}/{maxPlayers} | Staff: {staff}" -- The text to display
OTR.AllowedPlaceholders = {"players", "maxPlayers", "staff", "servername"} -- Placeholders that can be used in the text

-- Appearance Settings
OTR.TextScale = 0.5 -- Scale of the text
OTR.Font = 1 -- Font ID (0-7)

-- RGB Options
OTR.RGBMode = "static" -- Options: "smooth", "jump", "static"
OTR.RGBSpeed = 2.0 -- Speed multiplier (0.5 = slow, 2.0 = fast)
OTR.RGBAlpha = 255 -- Alpha value for RGB modes

-- Mode-specific settings
OTR.StaticColor = {r = 255, g = 0, b = 0, a = 255} -- Used when RGB is disabled
OTR.JumpInterval = 2000 -- ms between color jumps (for jump mode)
OTR.Palette = { -- Color palette for jump mode
    {r=255, g=0, b=0},    -- Red
    {r=0, g=255, b=0},    -- Green
    {r=0, g=0, b=255},    -- Blue
    {r=255, g=255, b=0},  -- Yellow
    {r=255, g=0, b=255},  -- Magenta
    {r=0, g=255, b=255}   -- Cyan
}

-- Position Settings
OTR.PositionX = 0.0 -- X position (0.0 to 1.0) 0.8 = right side of screen  0.5 = center of screen  0.0 = left side of screen
OTR.PositionY = 0.000 -- Y position (0.0 to 1.0) 0 = top of screen

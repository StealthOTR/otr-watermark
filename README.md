# OTR Watermark - FiveM Server Watermark Script

```
███████ ████████ ███████  █████  ██  ██████████  ██   ██       ███  ████████ ██████  
██         ██    ██      ██   ██ ██      ██      ██   ██      █   █    ██    ██   ██ 
███████    ██    █████   ███████ ██      ██      ███████     ███████   ██    ██████  
     ██    ██    ██      ██   ██ ██      ██      ██   ██     ██   ██   ██    ██   ██ 
███████    ██    ███████ ██   ██ ███████ ██      ██   ██      █████    ██    ██   ██
```

A highly customizable FiveM server watermark that displays server information with beautiful RGB effects.

## Features

✔ **Dynamic Text** - Show real-time server stats (players online, staff count, server name)  
✔ **Multiple RGB Modes** - Choose from smooth gradient, color jump, or static color  
✔ **Customizable Appearance** - Adjust position, font, scale, and update frequency  
✔ **Admin Controls** - Change RGB mode in-game with `/watermarkmode` command  
✔ **Optimized Performance** - Configurable update intervals to balance looks and performance  

## Installation

1. Download the latest release
2. Extract to your FiveM resources folder
3. Add `ensure otr-watermark` to your server.cfg
4. Configure settings in `config.lua`

## Configuration

All settings are in `config.lua`:

```lua
-- Basic Settings
OTR.Enabled = true -- Toggle the watermark
OTR.UpdateInterval = 1000 -- Update frequency in ms

-- Text Configuration
OTR.Text = "{servername} | Players: {players}/{maxPlayers} | Staff: {staff}"
OTR.AllowedPlaceholders = {"players", "maxPlayers", "staff", "servername"}

-- Appearance
OTR.TextScale = 0.5 -- Text size
OTR.Font = 1 -- Font ID (0-7)
OTR.PositionX = 0.0 -- Horizontal position (0.0-1.0)
OTR.PositionY = 0.000 -- Vertical position (0.0-1.0)

-- RGB Effects
OTR.RGBMode = "static" -- "smooth", "jump", or "static"
OTR.RGBSpeed = 2.0 -- Animation speed
OTR.RGBAlpha = 255 -- Transparency (0-255)

-- Static Color (when RGBMode = "static")
OTR.StaticColor = {r = 255, g = 0, b = 0, a = 255}

-- Jump Mode Settings
OTR.JumpInterval = 2000 -- Time between color changes (ms)
OTR.Palette = { -- Color options for jump mode
    {r=255, g=0, b=0},    -- Red
    {r=0, g=255, b=0},    -- Green
    {r=0, g=0, b=255},    -- Blue
    {r=255, g=255, b=0},  -- Yellow
    {r=255, g=0, b=255},  -- Magenta
    {r=0, g=255, b=255}   -- Cyan
}
```

## Usage

**Admin Command:**
```
/watermarkmode [smooth|jump|static] - Change RGB effect mode
```

**Placeholders:**
- `{players}` - Current player count
- `{maxPlayers}` - Server slot count  
- `{staff}` - Number of online staff members
- `{servername}` - Server hostname

## Support

I won't be providing support as it's a simple script and I am pretty busy atm. Maybe in the future.

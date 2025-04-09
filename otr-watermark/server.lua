local config = OTR
local lastJumpTime = 0
local currentPaletteIndex = 1

-- Staff counting function
function CountStaffOnline()
    local count = 0
    local players = GetPlayers()
    
    for _, playerId in ipairs(players) do
        if IsPlayerAceAllowed(playerId, 'admin') then
            count = count + 1
        end
    end
    
    return count
end

-- Improved rainbow function
function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
    result.a = OTR.RGBAlpha

    return result
end

-- RGB Mode Calculations
function GetCurrentColor(mode)
    if mode == "smooth" then
        return RGBRainbow(OTR.RGBSpeed * 0.5) -- Adjusted multiplier for good visual speed
    
    elseif mode == "jump" then
        if GetGameTimer() - lastJumpTime > OTR.JumpInterval then
            lastJumpTime = GetGameTimer()
            currentPaletteIndex = (currentPaletteIndex % #OTR.Palette) + 1
        end
        local color = OTR.Palette[currentPaletteIndex]
        return {r = color.r, g = color.g, b = color.b, a = OTR.RGBAlpha}
    
    else -- "static" or unknown mode
        return {
            r = OTR.StaticColor.r,
            g = OTR.StaticColor.g,
            b = OTR.StaticColor.b,
            a = OTR.RGBAlpha
        }
    end
end

-- Update watermark data for all clients
function UpdateWatermarkData()
    local data = {
        enabled = OTR.Enabled,
        text = OTR.Text,
        textScale = OTR.TextScale,
        font = OTR.Font,
        positionX = OTR.PositionX,
        positionY = OTR.PositionY,
        rgbMode = OTR.RGBMode,
        currentColor = GetCurrentColor(OTR.RGBMode)
    }
    
    -- Replace placeholders with actual data
    local formattedText = data.text
        :gsub("{players}", #GetPlayers())
        :gsub("{maxPlayers}", GetConvarInt("sv_maxclients", 64))
        :gsub("{staff}", CountStaffOnline())
        :gsub("{servername}", GetConvar("sv_hostname", "FiveM Server"))
    
    data.text = formattedText
    
    TriggerClientEvent('watermark:updateConfig', -1, data)
end

-- Initial update and periodic updates
Citizen.CreateThread(function()
    while true do
        UpdateWatermarkData()
        Citizen.Wait(OTR.UpdateInterval)
    end
end)

-- Admin command to change RGB mode
RegisterCommand("watermarkmode", function(source, args)
    if source ~= 0 and not IsPlayerAceAllowed(source, 'command.watermark') then
        return
    end
    
    if #args < 1 then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Watermark", "Available modes: smooth, jump, static"}
        })
        return
    end
    
    local mode = string.lower(args[1])
    local validModes = {
        ["smooth"] = true,
        ["jump"] = true,
        ["static"] = true
    }
    
    if validModes[mode] then
        OTR.RGBMode = mode
        UpdateWatermarkData()
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Watermark", "Mode set to: " .. mode}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"Watermark", "Invalid mode. Available: smooth, jump, pulse, breathe, static"}
        })
    end
end, false)
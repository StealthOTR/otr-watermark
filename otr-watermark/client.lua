local watermarkData = {}
local receivedConfig = false

-- Draw the watermark
function DrawWatermark()
    if not watermarkData.enabled then return end
    
    -- Calculate text width for background
    --local textWidth = CalculateTextWidth(watermarkData.text, watermarkData.textScale)
    --local textHeight = watermarkData.textScale * 0.02
    --
    ---- Draw background if enabled
    --if watermarkData.backgroundEnabled then
    --    local bgX = watermarkData.positionX - watermarkData.backgroundPadding
    --    local bgY = watermarkData.positionY - watermarkData.backgroundPadding
    --    local bgWidth = textWidth + (watermarkData.backgroundPadding * 2)
    --    local bgHeight = textHeight + (watermarkData.backgroundPadding * 2)
    --    
    --    DrawRect(
    --        bgX + (bgWidth / 2), 
    --        bgY + (bgHeight / 2), 
    --        bgWidth, 
    --        bgHeight, 
    --        watermarkData.backgroundColor.r, 
    --        watermarkData.backgroundColor.g, 
    --        watermarkData.backgroundColor.b, 
    --        watermarkData.backgroundColor.a
    --    )
    --end
    
    -- Draw the text
    SetTextFont(watermarkData.font)
    SetTextScale(watermarkData.textScale, watermarkData.textScale)
    SetTextColour(
        watermarkData.currentColor.r, 
        watermarkData.currentColor.g, 
        watermarkData.currentColor.b, 
        watermarkData.currentColor.a
    )
    SetTextEntry("STRING")
    AddTextComponentSubstringPlayerName(watermarkData.text)
    SetTextOutline()
    DrawText(watermarkData.positionX, watermarkData.positionY)
end

-- Calculate text width
function CalculateTextWidth(text, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextFont(watermarkData.font)
    SetTextScale(scale, scale)
    return EndTextCommandGetWidth(true)
end

-- Receive config from server
RegisterNetEvent('watermark:updateConfig')
AddEventHandler('watermark:updateConfig', function(data)
    watermarkData = data
    receivedConfig = true
end)

-- Main thread
Citizen.CreateThread(function()
    while not receivedConfig do
        Citizen.Wait(100)
    end
    
    while true do
        DrawWatermark()
        Citizen.Wait(0) -- Update every frame for smooth effects
    end
end)
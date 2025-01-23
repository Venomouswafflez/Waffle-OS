-- /src/ui/hover.lua

local hover = {}

-- Function to handle hover effect on buttons
function hover.handleHoverEffect(buttons)
    local _, _, x, y = os.pullEvent("mouse_move")
    local hoveredButton = nil
    for _, button in ipairs(buttons) do
        if x >= button.x and x <= button.x + button.width - 1 and y >= button.y and y < button.y + 3 then
            hoveredButton = button
        end
    end
    
    -- Highlight the hovered button
    return hoveredButton
end

return hover

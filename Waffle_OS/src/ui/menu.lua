-- /src/ui/menu.lua

local button = require("ui.button")
local styles = require("ui.styles")
local hover = require("ui.hover")

local menu = {}

-- Function to print the main menu with styled buttons
function menu.printMenu()
    local width, height = term.getSize()
    styles.setBackgroundColor(colors.blue)  -- Background color

    -- Title centered
    local title = "Welcome to Waffle OS"
    local padding = math.floor((width - string.len(title)) / 2)
    print(string.rep(" ", padding) .. title)

    -- Button properties
    local buttonHeight = 3
    local buttonWidth = 15
    local totalButtons = 3
    local buttonYStart = math.floor((height - (buttonHeight * totalButtons)) / 2)
    
    -- Button data
    local buttons = {
        {text = "Login", y = buttonYStart, x = math.floor((width - buttonWidth) / 2), width = buttonWidth},
        {text = "Create Account", y = buttonYStart + buttonHeight, x = math.floor((width - buttonWidth) / 2), width = buttonWidth},
        {text = "Shutdown", y = buttonYStart + buttonHeight * 2, x = math.floor((width - buttonWidth) / 2), width = buttonWidth}
    }

    -- Handle hover effect
    local hoveredButton = hover.handleHoverEffect(buttons)
    
    -- Print buttons with hover effect
    for _, buttonData in ipairs(buttons) do
        if hoveredButton == buttonData then
            styles.setButtonColor(colors.yellow)  -- Highlight button
        else
            styles.setButtonColor(colors.gray)
        end
        button.printStyledButton(buttonData.text, buttonData.x, buttonData.y, buttonData.width)
    end
end

return menu

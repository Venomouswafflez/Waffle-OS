local button = {}

-- Function to print a styled button with borders
function button.printStyledButton(text, x, y, width)
    -- Draw the border
    term.setCursorPos(x, y)
    term.write("+" .. string.rep("-", width - 2) .. "+")
    
    -- Print the text inside the button (centered)
    local padding = math.floor((width - 2 - #text) / 2)
    term.setCursorPos(x + 1 + padding, y + 1)
    term.write(text)
    
    -- Draw the bottom border
    term.setCursorPos(x, y + 2)
    term.write("+" .. string.rep("-", width - 2) .. "+")
end

return button





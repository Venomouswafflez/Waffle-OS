-- /src/ui/styles.lua

local styles = {}

-- Function to set a background color
function styles.setBackgroundColor(color)
    term.setBackgroundColor(color)
    term.clear()
end

-- Function to set button color
function styles.setButtonColor(color)
    term.setBackgroundColor(color)
end

return styles

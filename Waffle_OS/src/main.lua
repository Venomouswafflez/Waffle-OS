-- main.lua

local menu = require("ui.menu")

-- Main loop
while true do
    menu.printMenu()
    
    local event, button, x, y = os.pullEvent("mouse_click")
    -- Check which button was clicked
    if y >= buttonYStart and y <= buttonYStart + 3 then
        -- Login clicked
        print("Login clicked")
        -- Do login actions here
    elseif y >= buttonYStart + 3 and y <= buttonYStart + 6 then
        -- Create Account clicked
        print("Create Account clicked")
        -- Do create account actions here
    elseif y >= buttonYStart + 6 and y <= buttonYStart + 9 then
        -- Shutdown clicked
        print("Shutdown clicked")
        -- Shutdown actions here
        os.shutdown()
    end
end

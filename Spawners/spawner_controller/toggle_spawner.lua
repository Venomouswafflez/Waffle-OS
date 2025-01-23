local modem = peripheral.find("modem")

-- Ensure modem exists
if not modem then
    error("No modem found! Please connect a modem to the computer.")
end

-- Open listening channel for responses
local listening_channel = 47
local sending_channel = 36
modem.open(listening_channel)
print("Listening for responses on channel " .. listening_channel .. "...")

-- List of spawners
local spawners = {"Endermen", "Witch", "Cow", "Mob Farm"}

-- Function to display spawner options
local function displaySpawnerOptions()
    print("\nAvailable Spawners:")
    for i, spawner in ipairs(spawners) do
        print(i .. ". " .. spawner)
    end
end

-- Function to toggle a spawner
local function toggleSpawner(spawner)
    print("Toggling spawner: " .. spawner)
    modem.transmit(sending_channel, listening_channel, spawner) -- Send spawner name
end

-- Function to process responses
local function processResponse()
    print("Waiting for spawner response...")
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")

    if channel == listening_channel then
        -- Parse the message
        local received_spawner, state = message:match("(%S+)%s+(%S+)")
        state = state == "true" -- Convert string "true"/"false" to boolean

        if received_spawner then
            print(received_spawner .. " is now " .. (state and "ON" or "OFF"))
        else
            print("Unexpected response: " .. tostring(message))
        end
    end
end

-- Main program loop
while true do
    print("\nCommands: 'toggle', 'multi', 'list', 'quit'")
    local input = read()

    if input == "list" then
        displaySpawnerOptions()

    elseif input == "toggle" then
        displaySpawnerOptions()
        print("\nEnter the number of the spawner to toggle:")
        local spawner_number = tonumber(read())
        if spawner_number and spawners[spawner_number] then
            toggleSpawner(spawners[spawner_number])
            processResponse()
        else
            print("Invalid spawner number.")
        end

    elseif input == "multi" then
        displaySpawnerOptions()
        print("\nEnter the numbers of the spawners to toggle (comma-separated):")
        local spawner_numbers = read()
        local toggled_spawners = {}

        -- Parse input
        for spawner_number in spawner_numbers:gmatch("%d+") do
            spawner_number = tonumber(spawner_number)
            if spawners[spawner_number] then
                table.insert(toggled_spawners, spawners[spawner_number])
            else
                print("Invalid spawner number: " .. tostring(spawner_number))
            end
        end

        -- Toggle the selected spawners
        for _, spawner in ipairs(toggled_spawners) do
            toggleSpawner(spawner)
            processResponse()
        end

    elseif input == "quit" then
        print("Exiting program...")
        break

    else
        print("Invalid command. Please use 'toggle', 'multi', 'list', or 'quit'.")
    end
end

-- Clean up
modem.close(listening_channel)
print("Program terminated.")

local modem = peripheral.find('modem')
local spawnerChannel = 36,47


local function send_spawner(x)
    modem.transmit(spawnerChannel,x)
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    return message, 

return { send_spawner = send_spawner }
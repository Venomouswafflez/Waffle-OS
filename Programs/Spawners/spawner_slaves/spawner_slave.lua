local spawner = 'Witch'
local modem = peripheral.find("modem")
local side = 'top'
-- set Channels  (listen, transmit, "message")
local spawnerChannel = 36,47
-- open listening on channel 15
modem.open(36)


rs.setOutput(side, false)


--while loop listening event for a 
while true do    
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")

        --get the current Redstone output
       spawn_state = rs.getOutput(side)
    
       if message == spawner and spawn_state == false then
           rs.setOutput(side, true)
           sleep(1) 
           modem.transmit(spawnerChannel, spawner .. ' ' .. tostring(spawn_state))

       if message ==  spawner and spawn_state == true then
           rs.setOutput(side, false)
           sleep(1)
           modem.transmit(spawnerChannel, spawner .. ' ' .. tostring(spawn_state))

        if multishell == 'state_check'
            modem.transmit(spawnerChannel, tostring(spawn_state))
           sleep(1)
           
           end
       
end

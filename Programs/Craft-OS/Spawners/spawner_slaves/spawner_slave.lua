local spawner = 'Witch'
local modem = peripheral.find("modem")
-- open listening on channel 36
modem.open(36)

--while loop listening event for a 
while true do    
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
      
        --get the current Redstone output
       spawn_state = rs.getOutput('top')
       if message == spawner and spawn_state == false then
           rs.setOutput('top', true)
           changed_state = rs.getOutput('top')
           print('Spawner turned on')
           sleep(1) 
           modem.transmit(47, 36, spawner .. ' ' .. tostring(changed_state))
       else if message ==  spawner and spawn_state == true then
           rs.setOutput('top', false)
           changed_state = rs.getOutput('top')
           print('Spawner turned off')
           modem.transmit(47, 36, spawner .. ' ' .. tostring(changed_state))
       else 
       end
    end
end

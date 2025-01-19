-- set spawner name
local spawner = 'witch'


local m = peripheral.find("monitor")
local modem = peripheral.find("modem")
modem.open(15)
m.clear()
rs.setOutput('right', false)

while true do
    
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
       spawn_state = rs.getOutput('right')
       --modem.transmit(43, 15, spawner ..' '.. tostring(spawn_state))
       if message == spawner and spawn_state == false then
           rs.setOutput('right', true)
           m.clear()
           m.setCursorPos(1,1)
           m.write(spawner .. ' spawner set online')
           
           else
           end
       if message ==  spawner and spawn_state == true then
           rs.setOutput('right', false)
           m.clear()
           m.setCursorPos(1,1)
           m.write(spawner .. ' spawner set offline')
           else
           sleep(1)
           changed_state = rs.getOutput('right')
           
           modem.transmit(43,15, spawner .. ' ' .. tostring(changed_state))
           end
       
end

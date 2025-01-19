-- set spawner name
local spawner = 'Witch'
local m = peripheral.find("monitor")
local modem = peripheral.find("modem")
local side = 'top'

modem.open(15)
m.clear()
rs.setOutput(side, false)

while true do
    
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
       spawn_state = rs.getOutput(side)
       --modem.transmit(43, 15, spawner ..' '.. tostring(spawn_state))
       if message == spawner and spawn_state == false then
           rs.setOutput(side, true)
           m.clear()
           m.setCursorPos(1,1)
           m.write(spawner .. ' spawner set online')
           
           else
           end
       if message ==  spawner and spawn_state == true then
           rs.setOutput(side, false)
           m.clear()
           m.setCursorPos(1,1)
           m.write(spawner .. ' spawner set offline')
           else
           sleep(1)
           changed_state = rs.getOutput(side)
           
           modem.transmit(43,15, spawner .. ' ' .. tostring(changed_state))
           end
       
end

local m = peripheral.find('monitor')
m.clear()
m.getSize()

m.setCursorPos(1,1)
m.write("starting up")


shell.run('spawner_listen')

--
--  Server script for CC login system
--  https://github.com/olback/computercraft/blob/master/key-server/server/startup.lua
--

local modemSide = "top" -- Wireless/Wired modem
local hashFile = "password_hash.sha256" -- Don't change unless you know what you're doing!

file = fs.open(hashFile, "r")
hash = file.readAll()
file.close()

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)

if term.isColor() then
  term.setTextColor(colors.yellow)
end

print("-- olbOS Server v1.0 --")
term.setTextColor(colors.white)
print("Server ID: ", os.getComputerID())
rednet.open(modemSide)

while true do
  id, msg, dist = rednet.receive()
  
  if msg == "getHash" then
    rednet.send(id, hash)
    print("Sent to #", id)
  end
  
  if msg == "response" then
    print("Delivered to #", id)
  end
  
end

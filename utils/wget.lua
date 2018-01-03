
-- wget by olback

local version = "1.0D"
local args = { ... }
local headers = {["User-Agent"] = "wget by olback " .. version.. " like Chrome but better - Steve Jobs"}

print("Downloading...")
local download = http.get(args[1], headers)

if download ~= nil then 

  f = fs.open(args[2], "w")
  f.write(download.readAll())
  f.close()
  
else

  print("Failed to download file.")
  
end


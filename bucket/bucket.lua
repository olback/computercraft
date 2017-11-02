--
-- https://github.com/olback/computercrafr/bucket
--

local args = { ... }
local link = "https://test.olback.net/cc.php"
local token = "something-easy-yet-secure" -- Kinda lika a password. Everyone with this token can upload files to your server.

-- args[1]: action
-- args[2]: file to upload/download
-- args[3]: target file to save to (Only used when downloading)

----- Upload -----
function upload()

  local file = tostring(args[2])
  local f = fs.open(file, "r")
  local content = f.readAll()
  f.close()

  local data = "upload=&token=" .. token .. "&data=" .. textutils.urlEncode(content)
  local response = http.post(link, data)

  if response.getResponseCode() == 200 then
    print("Successfully uploaded. ID:", response.readAll())
  else
    error("Failed to upload file.")  
  end
end  

----- Download -----
function download()
  
  local data = "?download=" .. args[2]
  local response = http.get(link..data)
  local file = tostring(args[3])
  
  if response.getResponseCode() == 200 then
  
    local f = fs.open(file, "w")
    f.write(response.readAll())
    f.close()
    print("Downloaded ", args[2], " as ", args[3])
  
  else
    
    error("File not found")    
    
  end

end

--------------------------------------
if args[1] == "put" then

  if args[2] ~= nil then
    upload()
  else
    error("Please specify a file.")
  end

elseif args[1] == "get" then

  if args[2] ~= nil then  
    if args[3] ~= nil then
      download()
    else
      error("Please specify a target file.")
    end
  else
    error("Please specify a file to download.")
  end

else
  
  error("Please specify a action. get/put")
  
end

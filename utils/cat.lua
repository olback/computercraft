--
-- https://github.com/olback/computercraft/blob/master/utils/cat.lua
--

local args = { ... }

if args[1] == nil then
  error("No input file specified.")
  return
end

if fs.exists(args[1]) then

   if not fs.isDir(args[1]) then
   
      local f = fs.open(args[1], "r")
      print(f.readAll())
      f.close()
    
   else 
   
     error("Cannot open '" .. args[1] .. "'. It's a directory.")
     
   end

else 

  error("Cannot open '" .. args[1] .. "'. Does it exist?")

end

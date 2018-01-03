
-- echo by olback

local args = { ... }
local argsLen = table.getn(args)

function writeToFile(string, mode, file)

  local f = fs.open(file, mode)
  f.write(string.."\n")
  f.close()

end


function openFile(string, mode, file)
 
  if not fs.isDir(file) then
  
    if mode == "w" then
    
      writeToFile(string, "w", file)      
      
    elseif mode == "a" then
    
      writeToFile(string, "a", file)
    
    end
    
  else
      
    error("Cannot echo to directory.")
      
  end

end



if argsLen == 0 then

  error("Arguments expected.\nRun 'echo -h' for help.")

end

if argsLen == 1 and args[1] == "-h" then
  
  print("Echo usage:")
  print("Print text to the terminal: 'echo <string>'")
  print("Write over a file: 'echo <string> > <file>'")
  print("Append to a file: 'echo <string> >> <file>'")
  
elseif argsLen == 1 then

  print(args[1])

elseif argsLen == 2 then

  error("Invalid syntax.\nRun 'echo -h' for help")

elseif argsLen == 3 then

  if args[2] == ">" then
  
    openFile(args[1], "w", args[3])

  elseif args[2] == ">>" then
  
    openFile(args[1], "a", args[3])
    
  else
  
    error("Invalid syntax\nRun 'echo -h' for help.")
  
  end

end


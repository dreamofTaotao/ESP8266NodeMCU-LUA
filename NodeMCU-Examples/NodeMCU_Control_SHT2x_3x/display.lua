local moduleName = ... 
local M = {} 
_G[moduleName] = M 
function M.dispall(STemp,SHumi) 
     id=0 
     str3="t0.txt=\""..STemp.."\"" 
     str4="t1.txt=\""..SHumi.."\"" 
     uart.setup(id,9600,8,0,1,0) 
     uart.write(id,str3,0xff,0xff,0xff) 
     uart.write(id,str4,0xff,0xff,0xff) 
end 
 
return M
local STem=0 
local SHumi=0 
local PM=0 
local JQ=0 
require("sht20") 
require("display") 
sht20.initSHT20() 
tmr.alarm(2,6000,1,function() 
     SHumi=sht20.readHumi() 
     STemp=sht20.readTemp() 
     display.dispall(STemp,SHumi) 
end) 
collectgarbage() 
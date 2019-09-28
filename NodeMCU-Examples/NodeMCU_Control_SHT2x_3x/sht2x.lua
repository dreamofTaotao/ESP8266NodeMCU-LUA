local moduleName = ... 
local M = {} 
_G[moduleName] = M 
local sht20addr=0x40  
local measure_temp=0xe3 
local measure_humi=0xe5 
local id=0  

-- salveADDR 
function readData(slaveADDR,command,length,delayT) 
  i2c.start(id) 
  i2c.address(id, slaveADDR, i2c.TRANSMITTER) 
  i2c.write(id,command) 
  i2c.stop(id) 
  i2c.start(id) 
  i2c.address(id, slaveADDR,i2c.RECEIVER) 
  tmr.delay(delayT) 
  c = i2c.read(id,length) 
  i2c.stop(id) 
  return c 
end 
 
function M.readTemp() 
  dataT = readData(sht20addr,measure_temp,2,66000) 
  UT = string.byte(dataT,1)*256+string.byte(dataT,2) 
  TEMP=(UT*17572)/65536-4685 
  Temperature=TEMP/100 
  UT = nil 
  dataT = nil 
  TEMP=nil 
  return(Temperature) 
end 
 
function M.readHumi() 
  dataH =readData(sht20addr,measure_humi,2,22000) 
  UH = string.byte(dataH,1)*256+string.byte(dataH,2) 
  HUMI=(UH*12500)/65536-600 
  Humidity=HUMI/100 
  UH = nil 
  dataH = nil 
  HUMI=nil 
  return(Humidity) 
end 
 
function M.initSHT20() 
  i2c.setup(id,6,5,i2c.SLOW) 
  i2c.start(id) 
  i2c.address(id,sht20addr,i2c.TRANSMITTER) 
  i2c.write(id,0xfe) 
  i2c.stop(id) 
  tmr.delay(20000) 
end 
 
return M 
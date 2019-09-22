--    This program use the ssd1306 OLED and 
-- the resolution ratio is 128*64,you can choose a suitable u8g2 module
-- from NodeMCU Custom Build.
-- Note:You should care the timer's alarm weather be closed.Because
-- there will be some error that wo all didn't know if
-- many timer are working at the same time.
sda = 1--pin 1(GPIO5) for sda
scl = 2--pin 2(GPIO4) for scl
pin=5 --pin 5(GPIO14) for LED
num=1 --the variable for plus one every second
gpio.mode(pin, gpio.OUTPUT) --set GPIOmode for pin5(GPIO14)
gpio.write(pin, gpio.HIGH) --set High level to the pin5(GPIO14)
                           --the LED will light on if High level
                           --reverse it will light off
-- the init 1306screen function 
function init_OLED(sda,scl)
    sla=0x3c
    i2c.setup(0,sda,scl,i2c.SLOW)
    disp=u8g2.ssd1306_i2c_128x64_noname(0,sla)
    disp:setFont(u8g2.font_6x10_tf)
    disp:setFontRefHeightExtendedText()
    disp:setDrawColor(1)
    disp:setFontPosTop()
    disp:setFontDirection(0)
    disp:clearBuffer()
end

-- init ssd1306-screen
init_OLED(sda,scl)
-- create a new timer
mytimer=tmr.create()
--this is a alarm to freshen this screen every second
mytimer:alarm(1000,1,function()
    num=num+1
    --clear screen
    disp:clearBuffer()
    -- draw our want to show
    -- the first param is x-axis 
    -- the second param is y-axis
    -- the third param is strings what you want to show
    disp:drawStr(0,0,"hello")
    disp:drawStr(30,10,"world!")
    disp:drawStr(0,30,"Build by from Git:")
    disp:drawStr(40,40,"dreamofTaotao")
    -- the num is a variable
    disp:drawStr(0,50,"number_update:"..num)
    -- send our data to ssd1306-sreen and show that 
    disp:sendBuffer()
end)

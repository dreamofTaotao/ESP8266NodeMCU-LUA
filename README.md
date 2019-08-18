# ESP8266NodeMCU-LUA
Well, you can see that,I am learning the IOT.After I searched some modules,like ESP01,ESP12F,ESP32...and so on.I think this module is

very apt new learner,just like me.So,if you want to learn knowledge about this area,I suggest you can learn this first.

## File-init.lua
In this file is my first project after I learn the NodeMCU and some code about lua.

In this section,you can see I use this module connect wifi like:

``` lua

cfg={}                        --like Python's ditc

cfg.ssid="esp12f"             --your wifi's name

cfg.pwd="zt123456789"         --your wifi's password

--connect wifi station

wifi.setmode(wifi.STATION)    --set wifi's mode

wifi.sta.config(cfg)          --put your ditc to this config

wifi.sta.connect()            --connect wifi

```

And connect AliCloud,[click here to see details](https://github.com/dreamofTaotao/ESP8266NodeMCU-LUA/blob/master/init.lua).

### Special notes:

Official statement,previous some function didn't use after 2019 Q1,so if you face some problems or troubles,you can find out this 

authority. [here is the official documentation](https://nodemcu.readthedocs.io/en/master/).

### About update

When I study this module-NodeMCU(ESP8266), I should thanks for web and Internet.Although this is, I find some document are old,and 

there is no the Chinese document lastest.Therefore,if I have free time,I hope I can translate the lastest English Documentation.

## Most important

Continual updates of content......

#### Write at the end

welcome star or follow,I hope we can progress together :)

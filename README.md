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

  And connect AliCloud,[Click here to see details](https://github.com/dreamofTaotao/ESP8266NodeMCU-LUA/blob/master/init.lua).

## Folder-NodeMCU-apparatus

  In this file are some tools,documents and Chinese bibliography about NodeMCU,however,this file was published in 2014.The reason why I 
want to translate new document is that some API are outdate within old documents.

## Folder-NodeMCU-Ch

  There are translated API in Chinese. And this folder is updateing.If you want to see the introduction for API Chinese Version,[Click 
me](https://github.com/dreamofTaotao/ESP8266NodeMCU-LUA/blob/master/ESP8266NodeMCU-Ch/README.md).

### Special notes:

  Official statement,previous some function didn't use after 2019 Q1,so if you face some problems or troubles,you can find out this 
authority. [Here is the official documentation](https://nodemcu.readthedocs.io/en/master/).

### About update

  When I study this module-NodeMCU(ESP8266), I should thanks for web and Internet.Although this is, I find some document are old,and 
there isn't the Chinese document lastest.Therefore,if I have free time,I hope I can translate the lastest English Documentation.And I 
will might translate 17 modules including "ADC,crypto,file,GPIO,HTTP,I2C,MQTT,net,node"...and so on.And I will put this to this 
repository.

  If you are interested in this act.
  
  Welcome join this club! 
  
## Most important

  Continual updates of content......

#### Write at the end

  Welcome star or follow,I hope we can progress together :)

# WeChat Small-Size Program
I think there will be many people to linked MCU,but didn't find a better way to connect it.However,after I study the lesson of "半颗心脏",I 
want to operate this program by Lua.And already achieve it.Neither C nor Python.It's a Real luaguage of Lua.Awesome Lua connect AliCloud.

## Folder——WeChat_Control_Led
This file use the Mqtt Module,WiFi Module and GPIO module to accomplish how to connect AliIOTCloud according this PNG.

![ESP8266node](https://github.com/dreamofTaotao/ESP8266NodeMCU-LUA/blob/master/WeChat-Link-NodeMCU/WeChat_Control_LED/NodeMCU%E5%BC%95%E8%84%9A%E5%9B%BE.jfif)

And We used Pin 5 and please change AliCloud'username and password.Thank you so much!

## Thanks
Because when I debug this project using the real Phone got some errors that webSocket fail to connect.And after that I find 
some sovle methods.At the end,I know that the mqtt-min.js isn't suit to WeChat_Mini_Program.And I find a better mqtt.js for this 
project.And the Github is [Click Here](https://github.com/imliubo/Wechat_MQTT_ESP8266_BaiduIoT).

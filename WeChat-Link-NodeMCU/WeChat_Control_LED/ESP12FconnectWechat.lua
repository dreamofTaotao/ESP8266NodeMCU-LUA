-----[wifi config]-------------
---------------------------
cfg={}  
cfg.ssid="esp12"
cfg.pwd="zzzttt258123"

pin=5
gpio.mode(pin, gpio.OUTPUT)  --

----------------------------
ProductKey ="a1TnqRp8Zhi"   --
ClientId =wifi.sta.getmac()  -- 
DeviceName ="ESP12F"  -- 
DeviceSecret="WM30SPPJWrr5tCKpSvWa7eTu6YpJcbW0"
RegionId="cn-shanghai"     --

myMQTTport=1883    --port
myMQTT=nil        --client

myMQTThost=ProductKey..".iot-as-mqtt."..RegionId..".aliyuncs.com"   --host
myMQTTusername=DeviceName.."&"..ProductKey          --username

topic0="/a1TnqRp8Zhi/ESP12F/user/sub"   

----[wifi connect]---------------

wifi.setmode(wifi.STATION)  --
wifi.sta.config(cfg)        --
wifi.sta.connect()          --


wifi.eventmon.register(wifi.eventmon.STA_GOT_IP, function(T)
     print("Connected, IP is "..wifi.sta.getip())
end)

wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED, function(T)
     print("wifi disconnect")
end)



function GetNetTime()
    sntp.sync({"0.nodemcu.pool.ntp.org","1.nodemcu.pool.ntp.org","2.nodemcu.pool.ntp.org","3.nodemcu.pool.ntp.org","www.beijing-time.org"},
         function(sec, usec, server, info)
                 print('sync', sec, usec, server)       
         end,
         function()
            print("get time error")
         end)  
    return 0
end

--------MQTT------------------
mytimer = tmr.create()
myMQTTtimes='6666'
hmacdata="clientId"..ClientId.."deviceName"..DeviceName.."productKey"..ProductKey.."timestamp"..myMQTTtimes  
myMQTTpassword=crypto.toHex(crypto.hmac("sha1",hmacdata,DeviceSecret))    
myMQTTClientId=ClientId.."|securemode=3,signmethod=hmacsha1,timestamp="..myMQTTtimes.."|"   

myMQTT=mqtt.Client(myMQTTClientId, 120,myMQTTusername,myMQTTpassword) 

   

MQTTconnectFlag=0
mytimer=tmr.create()
mytimer:alarm(1000,tmr.ALARM_AUTO,function()
    if myMQTT~=nil then
        print("Attempting client connect...")
        myMQTT:connect(myMQTThost, myMQTTport,0,MQTTSuccess,MQTTFailed)
    end
end)

function MQTTSuccess(client)
    print("MQTT connected")
    client:subscribe(topic0,0, function(conn)     
        print("subscribe success") 
    end) 
    myMQTT=client
    MQTTconnectFlag=1    
    mytimer:stop()
end


function MQTTFailed(client,reson)
    print("Fail reson:"..reson)
    MQTTconnectFlag=0
    mytimer:start()     
end


myMQTT:on("offline", function(client) 
    print ("offline") 
    mytimer:start() --Here In Lastest SDK are changed,if want to learn,u can regsiter the NodeMCU web.
end)


myMQTT:on("message", function(client, topic, data) 
    print(topic ..":") 
    if data ~= nil then
        print(data)
    end
    if data=="on" then  
        gpio.write(pin, gpio.HIGH)   --
    else 
        gpio.write(pin,gpio.LOW)    
    end
end)



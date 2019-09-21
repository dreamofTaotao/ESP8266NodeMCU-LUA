//logs.js
const util = require('../../utils/util.js')
var mqtt = require('../../utils/mqtt.min.js')
const crypto = require('../../utils/hex_hmac_sha1.js');
Page({
    data: {
        messages:'zbcd',
        date:new Date().toLocaleString()
    },
    onLoad: function () {
        this.doConnect(),
        setInterval(() => {
            this.setData({
                //messages: message.toString(),
                date: new Date().toLocaleString()
            })
        }, 1000)
    },
    doConnect() {
        const deviceConfig = {
            productKey: "a1TnqRp8Zhi",
            deviceName: "WeChattest",
            deviceSecret: "VR8AEKNTkQ81BTQjvfl3BdQCVhsKSNjJ",
            regionId: "cn-shanghai"
        };
        const that=this
        const shuju="haha"
        const options = this.initMqttOptions(deviceConfig);
        //console.log(options)
        //console.log(that)
        const shu = {
            "s": "online|offline",
            "d": "12345565569",
            "f": "deviceName1234",
            "t": "2018-08-31 15:32:28.205",
            "g": "2018-08-31T07:32:28.205Z",
            "j": "2018-08-31 15:32:28.195",
            "e": "2018-08-31T07:32:28.195Z",
            "k": "123.123.123.123"
        }
        //替换productKey为你自己的产品的
        const client = mqtt.connect('wxs://a1TnqRp8Zhi.iot-as-mqtt.cn-shanghai.aliyuncs.com', options)
        client.on('connect', function () {
            console.log('连接服务器成功 hello world')
            //订阅主题，替换productKey和deviceName
            client.subscribe('/a1TnqRp8Zhi/WeChattest/user/sub', function (err) {
                if (!err) {
                
                    console.log('订阅成功')
                }
                if (!err) {
                    //这里其实不能发布的，需要后台设置权限，请参考阿里云官方文档
                    client.publish('/a1TnqRp8Zhi/WeChattest/user/pub',"off")   
                }
            })
            
        })
        //接收消息
        client.on('message', function (topic, message) {
            // message is Buffer
            console.log('收到消息：' + message.toString(), that)

            // that: message.toString()
            // datas = message.toString()
            that.setData({
                messages: message.toString()
            })
        })
        
        client.publish('/a1TnqRp8Zhi/WeChattest/user/pub',"01")

        
    },
    
    //IoT平台mqtt连接参数初始化
    initMqttOptions(deviceConfig) {

        const params = {
            productKey: deviceConfig.productKey,
            deviceName: deviceConfig.deviceName,
            timestamp: Date.now(),
            clientId: Math.random().toString(36).substr(2),
        }
        //CONNECT参数
        const options = {
            keepalive: 60, //60s
            clean: false, //cleanSession不保持持久会话
            protocolVersion: 3 //MQTT v3.1.1
        }
        //1.生成clientId，username，password
        options.password = this.signHmacSha1(params, deviceConfig.deviceSecret);
        options.clientId = `${params.clientId}|securemode=2,signmethod=hmacsha1,timestamp=${params.timestamp}|`;
        options.username = `${params.deviceName}&${params.productKey}`;

        return options;
    },

    /*
      生成基于HmacSha1的password
      参考文档：https://help.aliyun.com/document_detail/73742.html?#h2-url-1
    */
    signHmacSha1(params, deviceSecret) {

        let keys = Object.keys(params).sort();
        // 按字典序排序
        keys = keys.sort();
        const list = [];
        keys.map((key) => {
            list.push(`${key}${params[key]}`);
        });
        const contentStr = list.join('');
        return crypto.hex_hmac_sha1(deviceSecret, contentStr);
    }
})


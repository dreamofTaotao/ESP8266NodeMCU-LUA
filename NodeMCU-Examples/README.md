# ESP8266NodeMCU-常用模块实例

因为在编程的过程中想要查找相关的中文资料，发现没有最近两年的中文版。可能是因为我的英文太菜了，查阅起来有些不是很方便。所以，编写了我在编写NodeMCU的过程
中编写了我们在编写NodeMCU的过程中常用的一些模块的翻译，[Click me](https://github.com/dreamofTaotao/ESP8266NodeMCU-LUA/tree/master/ESP8266NodeMCU-Ch)

但是在编写翻译之后，又发现好多的函数其实，如果不进行一些实战演练的话，其实理解不了或者理解的不是非常的深刻，那么我又冒出了新的想法，就是想要为NodeMCU中
文文档中部分更加常用和比较难理解的函数写一些真实的实例。并且会写项目的实战，我将都会更新在Git中，供大家讨论学习。如果文档或者示例中存在错误或者有什么问
题，又可以在这里讨论。相信我们将进步的非常快。


### 说明
>> * 由于，最近跟同学接了一个项目，所以，可能在更新的速度上会放慢一些。但是，我会持续更新，因为我觉得可能这个是另一个解压并且放松的好地方->GitHub。

## NodeMCU_Control_SSD1306
This program use the ssd1306-12864 to achieve it.And in this file Every line has a comment.
Thanks:
       
       1.https://www.jianshu.com/p/8ec4a17b5da7
       
       2.https://blog.csdn.net/chinachenlu/article/details/90724022
       
       3.感谢大神土神121的Lua入门教程和ESP8266-Lua教程。

## NodeMCU_Control_SHT2x_3x
这个文件夹是使用ESP8266控制SHT2x以及3x的相关代码，虽然暂时（20190928）还没有跑通代码，现在还在研究怎么搞，但是，还是很难才找到的这个代码，认真看了一遍
SHT3x的说明文档，SHT2x的还没认真看，找到的这个代码是使用SHT20写的，现在需要改成3x，如果有大佬会的话，可以pull一下，大家一起学习。
之后可能会对说明文档翻译一下，还有也有可能会写一次CRC算法的笔记，毕竟博客里算法还没有。没有算法的代码是没有灵魂的！

Thanks：
       
       http://www.pudn.com/Download/item/id/3100490.html【感谢这个大佬的代码，找的好辛苦，真的是万里相会的感觉。】
       

# K610d-i5-d3-efi
Hasee k610d i5 d3 efi with clover5045 for macOS 10.14.6  
个人博客: https://www.1zilc.top/

屏幕截图
-----

![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot1.png)
![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot4.png)
![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot3.png)

说明
-----
1、Intel(R) Dual Band Wireless-AC 3160 无解(某宝comfast wu810n usb wifi已解决)  
2、独显无解(已屏蔽)  
3、核显已驱动 显存2048mb  
4、clover v5045  
5、睡眠完美  
6、小太阳完美(可通过fn组合键调节)  
7、声卡完美(内建声卡、可通过fn组合键调节)  
8、usb完美,hdmi完美,不支持vga  
9、已注入原装屏幕edid ,如果出现花屏闪屏自行提取自己的edid注入  
10、触控板最多支持三指手势  
11、自带intel蓝牙驱动正常  
12、请自行开启hidpi  
13、cpu可睿频,最高支持8档变频


已知bug
------
1、~~蓝牙概率性故障~~(已解决)  
2、如果使用fn+f1组合键睡眠后无法唤醒,需重启  
3、~~部分人概率性花屏~~(表现为chrome等软件闪屏,请确保bios开启csm、启动方式为DUAL)

更新日志
-------
#### 2019.8.20
* 更新clover至5045
* 更新lilu.kext至1.3.8  
* 更新AppleALC.kext至1.4.0  
* 更新WhateverGreen.kext至1.3.1  
* 恢复博通网卡驱动
* AR 9485 参考http://bbs.pcbeta.com/viewthread-1790406-1-1.html
https://github.com/athlonreg/ATH9KFixup
* 移除ATH9KFixup.kext,参数-ath9485

#### 2019.7.21
* 更新clover至5018,理论上支持macOS Catalina 10.15 beta4  
* 更新lilu.kext至1.3.7  
* 更新AppleALC.kext至1.3.9  
* 更新WhateverGreen.kext至1.3.0  (三件套增加对10.15的支持,详细更新内容自行查看:https://github.com/acidanthera)  
* 关于AR 9485的驱动,感谢[i0Ek3](https://github.com/i0Ek3)的issure~~将[Atheros9485](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/tree/master/Atheros9485)目录下的驱动放至S/L/E,再使用kext utility重建缓存即可~~  
* ~~添加了ATH9KFixup.kext,且添加启动参数-ath9485~~

#### 2019.7.1
* 更换原装蓝牙id注入方式,通过fakeSMC注入,pid 2012,vid 32903(若失效则参考:https://www.jianshu.com/p/877da48507e2)  

#### 2019.6.30
* 更新clover至4972,理论上支持macOS Catalina 10.15 beta2  
* 更新AirportBrcmFixup至2.0.0  
* ~~修复蓝牙无法驱动的问题,已patch到Kexts补丁,自带intel蓝牙id为0x07dc~~  
* 建议开启hidpi(参考:https://github.com/xzhih/one-key-hidpi/blob/master/README-zh.md)  
* 更换默认clover主题为OSS  

#### 2019.6.10
* 缓冲帧注入补丁,显存提升至2048mb  

#### 2019.6.5
* 更新lilu.kext至1.3.6  
* 更新AppleALC.kext至1.3.8  
* 更新WhateverGreen.kext至1.2.9  

#### 2019.5.25
* 更新clover至4934

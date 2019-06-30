# K610d-i5-d3-efi
Hasee k610d i5 d3 efi with clover4972 for macOS 10.14.5  
个人博客: https://www.1zilc.top/

屏幕截图
-----

![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot1.png)
![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot2.png)
![avatar](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/blob/master/screenshots/screenshot3.png)

说明
-----
1、wifi无解(某宝comfast wu810n usb wifi已解决)  
2、独显无解(已屏蔽)  
3、核显已驱动 显存2048mb  
4、clover v4972  
5、睡眠完美  
6、小太阳完美(可通过fn组合键调节)  
7、声卡完美(内建声卡、可通过fn组合键调节)  
8、usb完美,hdmi完美,不支持vga  
9、已注入原装屏幕edid ,如果出现花屏闪屏自行提取自己的edid注入  
10、触控板最多支持三指手势  
11、自带intel蓝牙驱动patch到kext,开机正常使用(睡眠唤醒后失效)  
12、请自行开启hidpi  
13、cpu可睿频,最高支持8档变频


已知bug
------
1、~~蓝牙概率性故障~~(已解决)  
2、如果使用fn+f1组合键睡眠后无法唤醒,需重启  

更新日志
-------
#### 2019.6.30
* 更新clover至4972,理论上支持macOS Catalina 10.15 beta2  
* 更新AirportBrcmFixup至2.0.0  
* 修复蓝牙无法驱动的问题,已patch到Kexts补丁,自带intel蓝牙id为0x07dc(若失效则参考:https://www.jianshu.com/p/877da48507e2)  
* 建议开启hidpi(参考:https://github.com/xzhih/one-key-hidpi/blob/master/README-zh.md)  
* 更换默认clover主题为OSS  

#### 2019.6.10
* 缓冲帧注入补丁,显存提升至2048mb  

#### 2019.6.5
* 更新lilu.kext至1.3.6  
* 更新AppleALC至1.3.8  
* 更新WhateverGreen至1.2.9  

#### 2019.5.25
* 更新clover至4934

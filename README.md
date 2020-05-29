# K610d-i5-d3-efi
<img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/1zilc/K610d-i5-d3-10.14.5-efi-clover">&nbsp;


Hasee k610d i5 d3 efi with clover5118 for macOS 10.15.5  

屏幕截图
-----

![avatar](https://s1.ax1x.com/2020/05/29/tnJetH.png)
![avatar](https://s1.ax1x.com/2020/05/29/tuQood.png)
![avatar](https://s1.ax1x.com/2020/05/29/tnJE7D.png)
![avatar](https://s1.ax1x.com/2020/05/29/tnJA0O.png)
![avatar](https://s1.ax1x.com/2020/05/29/tnJknK.png)

说明
-----
1、Intel(R) Dual Band Wireless-AC 3160 (方案一:可通过[intel-wifi](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/tree/master/intel-wifi)驱动)(方案二:某宝comfast wu810n usb wifi解决)  
2、独显无解(已屏蔽)  
3、核显已驱动 显存2048mb  
4、clover v5118  
5、睡眠完美  
6、小太阳完美(可通过fn组合键调节)  
7、声卡完美(内建声卡、可通过fn组合键调节)  
8、usb完美,hdmi完美,不支持vga  
9、已注入原装屏幕edid ,如果出现花屏闪屏自行提取自己的edid注入  
10、触控板最多支持三指手势  
11、自带intel蓝牙驱动正常(配合intel-wifi食用)  
12、请自行[开启hidpi](https://github.com/xzhih/one-key-hidpi/blob/master/README-zh.md)  
13、cpu可睿频,最高支持8档变频  
14、感谢[as614001](https://github.com/as614001)提供的方法,AR9485驱动方式参考[issue](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/issues/15)  
15、如果需要稳定的MAC系统的话不推荐一直升级，每次升级都会出现不同的问题，毕竟目前10.15版本还是存在很多不稳定bug。稳定的版本推荐[10.14.6](https://blog.daliansky.net/macOS-Mojave-10.14.6-18G87-Release-version-with-Clover-5033-original-image.html)，将EFI替换即可,这个版本相对稳定很多，bug较少。

已知bug
------
1、~~蓝牙概率性故障~~(已解决)  
2、如果使用fn+f1组合键睡眠后无法唤醒,需重启  
3、~~部分人概率性花屏~~(已解决)(表现为chrome等软件闪屏,请确保bios开启csm、启动方式为DUAL)  
4、hdmi如出现问题,参考[whhjdi](https://github.com/whhjdi)的[issue](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/issues/5#issue-481843661)  
5、由于hda和appleALC存在冲突,hdmi在10.15.5以后暂时没有声音,10.15.3即以下的10.14系统用[老版本releases EFI](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/releases)没有问题  

更新日志
-------
#### 2020.5.29
* 更新clover至5118  支持引导10.15.5正式版(已更新)
* 更新lilu.kext至1.4.4
* 更新AppleALC.kext至1.4.9
* 更新WhateverGreen.kext至1.3.9
* 在Devices-properties中注入补丁,屏蔽hdmi audio,解决睡眠唤醒后重启引导的问题,参考[tonymacx8](https://www.tonymacx86.com/threads/help-applealc-kernel-panic-after-catalina-update.284654/page-12)
* 添加intel-ac3160-wifi驱动文件,ac3160成功驱动,速度还不错~,理论上intel网卡都可使用,参考[远景](http://bbs.pcbeta.com/viewthread-1856465-1-1.html)
* [release 10.15.5](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/releases/tag/10.15.5)

#### 2020.5.3
* clover --> 5115 支持引导10.15.4
* lilu --> 1.4.3
* AppleALC --> 1.4.8
* WhateverGreen --> 1.3.8

#### 2020.3.4
* 感谢[c834606877](https://github.com/c834606877)的[PR](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/pull/25),现已合并到master分支, 修改USB电源属性，以满足iPad和iPhone的2.1A快充功能等
* 回退VirtualSMC为fakeSMC
* 新增blur主题

#### 2020.2.25😷
* 更新clover至5104
* 更新lilu.kext至1.4.1
* 更新AppleALC.kext至1.4.6
* 更新WhateverGreen.kext至1.3.6
* ~~更新VirtualSMC全家桶至1.1.1~~
* 感谢[LeisureCheng](https://github.com/LeisureCheng)的建议,更新AirportBrcmFixup至2.0.6,支持博通网卡在10.15中驱动
* 在properties中注入补丁,调整cursormemorysize为9mb,解决HD4600局部花屏

#### 2020.1.17
* 合并10.15.2分支,修复HDA和appleALC 冲突引起的唤醒重启
* ~~更换fakeSMC为VirtualSMC,更为完善的白果方案~~
* [release 10.15.2](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/releases/tag/10.15.2)

#### 2019.12.25🎄
* 更新clover至5101,理论支持macOS Catalina 10.15.2  
* 更新lilu.kext至1.4.0  
* 更新AppleALC.kext至1.4.4  
* 更新WhateverGreen.kext至1.3.5  
* ACPI中注入EC相关补丁,修复升级Catalina 10.15 卡[appleps2controller notification consumer published appleps2mouse](https://github.com/khronokernel/What-s-new-in-macOS-Catalina#current-issues-with-catalina)

#### 2019.11.21
* 更新clover至5098  
* 更新lilu.kext至1.3.9  
* 更新AppleALC.kext至1.4.3  
* 更新WhateverGreen.kext至1.3.4  

#### 2019.10.14
* 更新clover至5070  
* 更新AppleALC.kext至1.4.2  
* 更新WhateverGreen.kext至1.3.3  

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
* 更新clover至5018  
* 更新lilu.kext至1.3.7  
* 更新AppleALC.kext至1.3.9  
* 更新WhateverGreen.kext至1.3.0  (三件套增加对10.15的支持,详细更新内容自行查看:https://github.com/acidanthera)  
* 关于AR 9485的驱动,感谢[i0Ek3](https://github.com/i0Ek3)的issue~~将[Atheros9485](https://github.com/1zilc/K610d-i5-d3-10.14.5-efi-clover/tree/master/Atheros9485)目录下的驱动放至S/L/E,再使用kext utility重建缓存即可~~  
* ~~添加了ATH9KFixup.kext,且添加启动参数-ath9485~~

#### 2019.7.1
* 更换原装蓝牙id注入方式,通过fakeSMC注入,pid 2012,vid 32903(若失效则参考:https://www.jianshu.com/p/877da48507e2)  

#### 2019.6.30
* 更新clover至4972  
* 更新AirportBrcmFixup至2.0.0  
* ~~修复蓝牙无法驱动的问题,已patch到Kexts补丁,自带intel蓝牙id为0x07dc~~  
* 建议开启hidpi(参考:https://github.com/xzhih/one-key-hidpi/blob/master/README-zh.md)  
* 更换默认clover主题为OSS-神舟战神专版  

#### 2019.6.10
* 缓冲帧注入补丁,显存提升至2048mb  

#### 2019.6.5
* 更新lilu.kext至1.3.6  
* 更新AppleALC.kext至1.3.8  
* 更新WhateverGreen.kext至1.2.9  

#### 2019.5.25
* 更新clover至4934

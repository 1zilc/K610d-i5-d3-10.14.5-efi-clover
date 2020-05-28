#!/bin/bash

IFS_old=$IFS;IFS=$'\n'
echo $IFS
thisDir=$(dirname $0)
thatDir="/tmp"
configDir=~/.AppleIntelWiFi

function save_password()
{
	stty -echo
	read -p "请输入密码(Mac登陆密码):" password
	stty echo
	echo -e
	echo "$password" > $configDir/password.txt
}

function test_password()
{
	local test_result=0
	read password < $configDir/password.txt
	echo "$password" | sudo -S touch $thisDir/.tmp
	if [[ ! -e "$thisDir/.tmp" ]];then
		test_result=0
	else
		echo "$password" | sudo -S mount -uw /
		killall Finder
		echo "$password" | sudo -S rm $thisDir/.tmp
		test_result=1
	fi
	return $test_result
}

function main_task()
{
	if [[ ! -e "$configDir/ssid.txt" ]];then
		touch $configDir/ssid.txt
	fi
	echo ""
	content=`cat $configDir/ssid.txt`
	if [[ "$content" != "" ]];then
		echo "【Wi-Fi列表】"
	fi
	kextindex=1
	declare -a kextdict
	for kextname in `cat $configDir/ssid.txt`
	do
		echo $kextindex":"$kextname
		kextdict[$kextindex]=$kextname
		kextindex=$(($kextindex+1))
	done
	echo "【输入a新增连接，输入q退出连接，"
	echo "输入序号连接Wi-Fi，输入d删除列表中的Wi-Fi】"
	echo "------------------------------------------------------"

	read -p"请选择您要的操作：" index

	if [[ "$index" = "q" ]];then
		echo "--------------AppleIntelWiFi连接加载脚本--------------"
		IFS=$IFS_old;exit 1
	elif [[ "$index" = "a" ]];then
		read -p"Wi-Fi名字：" ssid
		read -p"Wi-Fi密码(无密码回车跳过)：" psw
		echo "$ssid:$psw" >> $configDir/ssid.txt
	elif [[ "$index" = "d" ]];then
		while :
		do
			read -p"选择要删除的Wi-Fi(序号)或输入q退出操作：" index
			if [[ "$index" = "q" ]];then
				break
			else
				selectssid=${kextdict[$index]}
				sed -i "" "/$selectssid/d" $configDir/ssid.txt
				echo "已为您删除【${selectssid}】。"
				content=`cat $configDir/ssid.txt`
				if [[ "$content" = "" ]];then
					break
				fi
			fi
		done
		echo "--------------AppleIntelWiFi连接加载脚本--------------"
		IFS=$IFS_old;exit 1
	
	else
		selectssid=${kextdict[$index]}
		ssid=`echo $selectssid | cut -d ":" -f 1`
		psw=`echo $selectssid | cut -d ":" -f 2`

	fi

	if [[ "$psw" = "" ]];then
		echo "您要连接的是【${ssid}】,无密码。"
	else
		echo "您要连接的是【${ssid}】,密码是【${psw}】。"
	fi

	echo "------------------------------------------------------"
	echo "连接中，请不要退出终端"

	if [[ -d "$thatDir/AppleIntelWiFi.kext" ]];then
		echo "$password" | sudo -S rm -r $thatDir/AppleIntelWiFi.kext
	fi

	echo "$password" | sudo -S cp -r $thisDir/AppleIntelWiFi.kext /tmp

	echo "$password" | sudo -S /usr/libexec/PlistBuddy -c "Set :IOKitPersonalities:AppleIntelWiFi:IFConfig:NWID ${ssid}" $thatDir/AppleIntelWiFi.kext/Contents/Info.plist
	echo "$password" | sudo -S /usr/libexec/PlistBuddy -c "Set :IOKitPersonalities:AppleIntelWiFi:IFConfig:WPAKEY ${psw}" $thatDir/AppleIntelWiFi.kext/Contents/Info.plist
	if [[ "$psw" = "" ]];then
	echo "$password" | sudo -S /usr/libexec/PlistBuddy -c "Set :IOKitPersonalities:AppleIntelWiFi:IFConfig:WPA/WPA2 false" $thatDir/AppleIntelWiFi.kext/Contents/Info.plist
	else
	echo "$password" | sudo -S /usr/libexec/PlistBuddy -c "Set :IOKitPersonalities:AppleIntelWiFi:IFConfig:WPA/WPA2 true" $thatDir/AppleIntelWiFi.kext/Contents/Info.plist
	fi

	echo "$password" | sudo -S chmod -R 755 "$thatDir"/AppleIntelWiFi.kext
	echo "$password" | sudo -S chmod 644 "$thatDir"/AppleIntelWiFi.kext/Contents/Info.plist
	echo "$password" | sudo -S chown -R root:wheel "$thatDir"/AppleIntelWiFi.kext

	echo "$password" | sudo -S codesign --force --deep --sign - $thatDir/AppleIntelWiFi.kext
	echo "$password" | sudo -S kextutil -q "$thatDir"/AppleIntelWiFi.kext
}

function main()
{
	echo "--------------AppleIntelWiFi连接加载脚本--------------"
	if [[ ! -d "$configDir" ]];then
		mkdir $configDir
	fi

	result=`kextstat | grep "AppleIntelWiFi"`
	if [[ "$result" != "" ]];then
		echo "驱动已被加载过，如果想重新加载，请先重启系统"
		echo "--------------AppleIntelWiFi连接加载脚本--------------"
		IFS=$IFS_old;exit 1
	fi

	if [[ ! -e "$configDir/password.txt" ]];then
		save_password
	fi

	i=0
	while [ $i -lt 3 ]
	do
		test_password
		test_result=$?
		if [[ "$test_result" == 1 ]];then
			main_task
			result=`kextstat | grep "AppleIntelWiFi"`
			if [[ "$result" != "" ]];then
				echo "驱动成功，可以退出终端"
			else
				echo "驱动未加载成功，请退出终端并检查驱动文件是否完整"
			fi
			echo "--------------AppleIntelWiFi连接加载脚本--------------"
			IFS=$IFS_old;exit 1
		else
			echo "对不起，密码错误"
			save_password
		fi
		let i++
	done
}

main
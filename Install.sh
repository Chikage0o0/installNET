#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: CentOS 6/7,Debian 8/9,Ubuntu 16+
#	Description: 一键重装系统
#	Version: 1.0.1
#	Author: 千影,Vicer
#	Blog: https://www.94ish.me/
#=================================================

sh_ver="1.0.1"
github="raw.githubusercontent.com/chiakge/installNET/master"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

#安装环境
first_job(){
if [[ "${release}" == "centos" ]]; then
	yum install -y xz openssl gawk file
elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
	apt-get update
	apt-get install -y xz-utils openssl gawk file	
fi
}

# 安装系统
InstallOS(){
read -p " 请设置密码:" pw
if [[ "${model}" == "自动" ]]; then
	model="a"
else 
	model="m"
fi
if [[ "${country}" == "国外" ]]; then
	country=""
else 
	if [[ "${os}" == "c" ]]; then
		country="--mirror https://mirrors.tuna.tsinghua.edu.cn/centos/"
	elif [[ "${os}" == "u" ]]; then
		country="--mirror https://mirrors.tuna.tsinghua.edu.cn/ubuntu/"
	elif [[ "${os}" == "d" ]]; then
		country="--mirror https://mirrors.tuna.tsinghua.edu.cn/debian/"
	fi
fi
wget --no-check-certificate https://${github}/InstallNET.sh && chmod -x InstallNET.sh
bash InstallNET.sh -${os} ${1} -v ${vbit} -${model} -p ${pw} ${country}
}
# 安装系统
installadvanced(){
read -p " 请设置参数:" advanced
wget --no-check-certificate https://${github}/InstallNET.sh && chmod -x InstallNET.sh
bash InstallNET.sh $advanced
}
# 切换位数
switchbit(){
if [[ "${vbit}" == "64" ]]; then
	vbit="32"
else
	vbit="64"
fi
}
# 切换模式
switchmodel(){
if [[ "${model}" == "自动" ]]; then
	model="手动"
else
	model="自动"
fi
}
# 切换国家
switchcountry(){
if [[ "${country}" == "国外" ]]; then
	country="国内"
else
	country="国外"
fi
}

#安装CentOS
installCentos(){
clear
os="c"
echo && echo -e " 一键网络重装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  -- 就是爱生活 | 94ish.me --
  
————————————选择版本————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 CentOS6.8系统
 ${Green_font_prefix}2.${Font_color_suffix} 安装 CentOS6.9系统
————————————切换模式————————————
 ${Green_font_prefix}3.${Font_color_suffix} 切换安装位数
 ${Green_font_prefix}4.${Font_color_suffix} 切换安装模式
 ${Green_font_prefix}5.${Font_color_suffix} 切换镜像源
————————————————————————————————
 ${Green_font_prefix}0.${Font_color_suffix} 返回主菜单" && echo

echo -e " 当前模式: 安装${Red_font_prefix}${vbit}${Font_color_suffix}位系统，${Red_font_prefix}${model}${Font_color_suffix}模式,${Red_font_prefix}${country}${Font_color_suffix}镜像源。"
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	0)
	start_menu
	;;
	1)
	InstallOS "6.8"
	;;
	2)
	InstallOS "6.9"
	;;
	3)
	switchbit
	installCentos
	;;
	4)
	switchmodel
	installCentos
	;;
	5)
	switchcountry
	installCentos
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-11]"
	sleep 5s
	installCentos
	;;
esac
}

#安装Debian
installDebian(){
clear
os="d"
echo && echo -e " 一键网络重装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  -- 就是爱生活 | 94ish.me --
  
————————————选择版本————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 Debian9系统
 ${Green_font_prefix}2.${Font_color_suffix} 安装 Debian10系统
 ${Green_font_prefix}3.${Font_color_suffix} 安装 Debian11系统
————————————切换模式————————————
 ${Green_font_prefix}4.${Font_color_suffix} 切换安装位数
 ${Green_font_prefix}5.${Font_color_suffix} 切换安装模式
 ${Green_font_prefix}6.${Font_color_suffix} 切换镜像源
————————————————————————————————
 ${Green_font_prefix}0.${Font_color_suffix} 返回主菜单" && echo

echo -e " 当前模式: 安装${Red_font_prefix}${vbit}${Font_color_suffix}位系统，${Red_font_prefix}${model}${Font_color_suffix}模式,${Red_font_prefix}${country}${Font_color_suffix}镜像源。"
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	0)
	start_menu
	;;
	1)
	InstallOS "9"
	;;
	2)
	InstallOS "10"
	;;
	3)
	InstallOS "11"
	;;
	4)
	switchbit
	installDebian
	;;
	5)
	switchmodel
	installDebian
	;;
	6)
	switchcountry
	installDebian
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-11]"
	sleep 5s
	installCentos
	;;
esac
}

#安装Ubuntu
installUbuntu(){
clear
os="u"
echo && echo -e " 一键网络重装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  -- 就是爱生活 | 94ish.me --
  
————————————选择版本————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 Ubuntu16系统
 ${Green_font_prefix}2.${Font_color_suffix} 安装 Ubuntu18系统
 ${Green_font_prefix}3.${Font_color_suffix} 安装 Ubuntu20系统
————————————切换模式————————————
 ${Green_font_prefix}4.${Font_color_suffix} 切换安装位数
 ${Green_font_prefix}5.${Font_color_suffix} 切换安装模式
 ${Green_font_prefix}6.${Font_color_suffix} 切换镜像源
————————————————————————————————
 ${Green_font_prefix}0.${Font_color_suffix} 返回主菜单" && echo

echo -e " 当前模式: 安装${Red_font_prefix}${vbit}${Font_color_suffix}位系统，${Red_font_prefix}${model}${Font_color_suffix}模式,${Red_font_prefix}${country}${Font_color_suffix}镜像源。"
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	0)
	start_menu
	;;
	1)
	InstallOS "16.04"
	;;
	2)
	InstallOS "18.04"
	;;
	3)
	InstallOS "20.04"
	;;
	4)
	switchbit
	installUbuntu
	;;
	5)
	switchmodel
	installUbuntu
	;;
	6)
	switchcountry
	installUbuntu
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-11]"
	sleep 5s
	installCentos
	;;
esac
}
#开始菜单
start_menu(){
clear
echo && echo -e " 一键网络重装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  -- 就是爱生活 | 94ish.me --
  
————————————重装系统————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 CentOS系统
 ${Green_font_prefix}2.${Font_color_suffix} 安装 Debian系统
 ${Green_font_prefix}3.${Font_color_suffix} 安装 Ubuntu系统
 ${Green_font_prefix}4.${Font_color_suffix} 高级模式（自定义参数）
————————————切换模式————————————
 ${Green_font_prefix}5.${Font_color_suffix} 切换安装位数
 ${Green_font_prefix}6.${Font_color_suffix} 切换安装模式
 ${Green_font_prefix}7.${Font_color_suffix} 切换镜像源
————————————————————————————————" && echo

echo -e " 当前模式: 安装${Red_font_prefix}${vbit}${Font_color_suffix}位系统，${Red_font_prefix}${model}${Font_color_suffix}模式,${Red_font_prefix}${country}${Font_color_suffix}镜像源。"
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	1)
	installCentos
	;;
	2)
	installDebian
	;;
	3)
	installUbuntu
	;;
	4)
	installadvanced
	;;
	5)
	switchbit
	start_menu
	;;
	6)
	switchmodel
	start_menu
	;;
	7)
	switchcountry
	start_menu
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-11]"
	sleep 5s
	start_menu
	;;
esac
}


#############系统检测组件#############

#检查系统
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
}


check_sys
first_job
model="自动"
vbit="64"
country="国外"
start_menu


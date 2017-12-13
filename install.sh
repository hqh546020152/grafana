#!/bin/bash

#使用前提，Zabbix部署完毕，并能显示出期望的数据

yum install -y initscripts fontconfig

rpm -ivh ./package/grafana-4.0.2-1481203731.x86_64.rpm

yum install -y fontconfig

yum install -y freetype*

yum install -y urw-fonts


#显示安装的文件
rpm -qc grafana

#二进制文件 /usr/sbin/grafana-server
#服务管理脚本 /etc/init.d/grafana-server
#安装默认文件 /etc/sysconfig/grafana-server
#配置文件 /etc/grafana/grafana.ini

systemctl start grafana-server

systemctl enable grafana-server


#获取可用插件列表
grafana-cli plugins list-remote

#安装Zabbix插件
grafana-cli plugins install alexanderzobnin-zabbix-app

systemctl restart grafana-server

#curl localhost:3000


#添加可读取Zabbix数据库
#参考add_database目录中的图片

-------------------------------分割线-------------------------------

#导入模板
#参考tempalte目录

	#danyi.json  	可实时监控单个服务器
	#tongyi.json	可同时监控所有服务器
	#add_template.png	为添加模板步骤

#其他模板下载：
#https://grafana.com/dashboards?dataSource=alexanderzobnin-zabbix-datasource	

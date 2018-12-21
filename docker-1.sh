#!/bin/bash/

echo "=========================================="
echo "=                                        ="
echo "=          docke 抓取简单信息            ="
echo "=                                        ="
echo "=                                        ="
echo "=========================================="
echo "1)容器数量         4)输出容器的IP"            
echo "2)容器名称         5)输出容器的大小"          
echo "3)容器VNIC的MAC"              

a=`docker ps | awk 'NR!=1 {print $1}'`
b=`docker ps | awk 'NR!=1 {print $1}' | wc -l`

while true; do
    echo -e "输入选项: \c"
    read s
    if [ $s = 1 ]; then
        echo `docker ps | awk 'NR!=1 {print $1}' | wc -l`
      break
    fi
   
    if [ $s = 2 ]; then
        echo "`for i in $b;do docker inspect --format='{{.Name}}' $a;done`"
      break
    fi

    if [ $s = 3 ]; then	
        echo "`for i in $b;do docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $a;done`"
      break
    fi
   
    if [ $s = 4 ]; then
	echo "`for i in $b;do docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $a;done`"
      break
    fi
    if [ $s = 5 ]; then
	echo "`for i in $b;do docker inspect --format='{{.HostConfig.ShmSize}}' $a;done`"
      break
    fi      
done    

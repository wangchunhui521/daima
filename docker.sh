!#/bin/bash
a=`docker ps | awk 'NR!=1 {print $1}'`
b=`docker ps | awk 'NR!=1 {print $1}' | wc -l`
docker ps | awk 'NR!=1 {print $1}' | wc -l
for i in $b;do docker inspect --format='{{.Name}}' $a
docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $a
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $a
docker inspect --format='{{.HostConfig.ShmSize}}' $a
done

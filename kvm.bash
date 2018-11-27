#!/bin/bash

for i in 10 ;do
cd /var/lib/libvirt/images/
qemu-img create -f qcow2 $i 10G
echo -e "network name: \c"
read name
echo -e "network card name: \c"
read card
echo -e "Network segment: \c"
read a
echo -e "cpu num: \c"
read num
echo -e "Mem num: \c"
read num1
echo -e "Iso path : \c"
read path
echo "
<network>
  <name>$name</name>
  <uuid>`uuidgen`</uuid>
  <bridge name='$card' stp='off' delay='0'/>
  <mac address='52:54:00:7a:22:$i'/>
  <domain name='test$i'/>
  <ip address='192.168.$a.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.$a.11' end='192.168.$a.254'/>
    </dhcp>
  </ip>
</network>" > test$i
echo `virsh net-define test$i`
echo `virsh net-start $name`
echo "
`virt-install \
--name $i \
--vcpus $num \
--memory $num1 \
--cpu host-passthrough \
--location $path \
--disk /var/lib/libvirt/images/$i \
--network bridge=$name \
-x "console=ttyS0"`"
done

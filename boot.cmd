run loadimage

# boot from SD card
setenv rootfs /dev/mmcblk0p2

# boot from nfs (change nfsroot=... to match your installation)
#setenv rootfs /dev/nfs nfsroot=192.168.0.1:/path/to/rootfs,nolock,rsize=1024

setenv bootargs mem=${memsize} console=${console} root=${rootfs} rw rootwait ip=${ipaddr} lpj=747520
run mmcboot


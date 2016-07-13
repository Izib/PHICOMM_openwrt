This is for PHICOMM router to flash openwrt.

uboot.bin: I downloaded from internet. Sry, I don't remember who make it.
openwrt.bin: it come from openwrt official website.


1. Make the telnetd working on router.

    http://192.168.2.1/goform/Diagnosis?pingAddr=192.168.2.100|echo""|telnetd

2. copy the uboot.bin in the router. My way: telnet the router and wget the file.

    wget http://192.168.2.100/uboot.bin

3. write to bootloader

    mtd_write write uboot.bin Bootloader

4. send instruction to abort breed. It works while device startup. You should get echo after step #5

    watch -n 1 "ncat -v -s 192.168.1.3 -p 37540 -w10 -4u 255.255.255.255 37541 < breed.txt" 
    
    //Change the 192.168.1.3 to your ip address, if you only have one ethernet, just remove "-s 192.168.1.3" param. Recving "BREED:ABORTED" implies lucky if you use "ncat -v -4u -l 37540" to listen the echo. If you are using windows, I packed the ncat.exe, but you have to find a way to run it like "watch" on linux.

5. reboot your device

    reboot


6. Access http://192.168.1.1 to upload you openwrt.bin and flash your new firmware

Issues:

If you cannot get ip addr after reboot, try setting a static ip.

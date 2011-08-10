# Audio jack configuration
dev=/sys/devices/platform/simple_remote.0
echo 0,201,1600 > $dev/accessory_min_vals  # default = 0,200,1600
echo 200,1599  > $dev/accessory_max_vals  # default = 200,1600
echo 0,100,280,500,700 > $dev/button_min_vals  # default = 0,100,300,600,700
echo 99,199,399,699,5000  > $dev/button_max_vals  # default = 99,199,399,699,5000
echo 512   > $dev/btn_trig_period_freq  # Button Period Freq(Hz) default = 512
echo 16  > $dev/btn_trig_period_time  # Button Period Time(cycle) default = 16
echo 512   > $dev/btn_trig_hyst_freq    # Button Hysteresis Freq(Hz) default = 512
echo 16  > $dev/btn_trig_hyst_time   # Button Hysteresis Time(Cycle) default = 16
echo 500 > $dev/btn_trig_level  # default = 500

#copy modules from kernel to correct place
mount -o rw,remount -14mountt yaffs2 /dev/block/mtdblock0 /system
cp /modules/sdio.ko /system/lib/modules/sdio.ko
cp /modules/tiwlan_drv.ko /system/lib/modules/tiwlan_drvan_drv.ko
cp /modules/tiap_drv.ko /system/lib/modules/tiap_drv.ko
mount -o ro,remount -t yaffs2 /dev/block/mtdblock0 /system

# Proximity sensor configuration
dev=/sys/bus/i2c/devices/0-0054/
hwid=`cat /sys/class/hwid/hwid`
case $hwid in
0x0a)
echo  7 > $dev/nburst  # Number of pulses in burst. Valid range is 0 - 15.
echo  3 > $dev/freq    # Burst frequency. Valid range is 0 - 3.
;;
*)
echo  8 > $dev/nburst  # Number of pulses in burst. Valid range is 0 - 15.
echo  2 > $dev/freq    # Burst frequency. Valid range is 0 - 3.
;;
esac

# LMU AS3676 Configuration
dev=/sys/devices/i2c-0/0-0040/leds
echo 1,65,255,24,24,5,128 > $dev/lcd-backlight/als/curve  # ALS curve for group1
echo 2,0,0,0 > $dev/lcd-backlight/als/params  #[gain],[filter_up],[filter_down],[offset]
echo 1 > $dev/lcd-backlight/als/enable  #Sensor on/off. 1 = on, reg 90h
echo 20000 > $dev/lcd-backlight/max_current
echo 450 > $dev/button-backlight/max_current
echo 1000 > $dev/red/max_current
echo 1000 > $dev/green/max_current
echo 1000 > $dev/blue/max_current

# TI BQ275xx firmware loader
bq275xx_fwloader

rm -R /sdcard
ln -l /mnt/sdcard /sdcard

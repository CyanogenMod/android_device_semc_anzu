$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/anzu/anzu-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := anzu
PRODUCT_DEVICE := anzu
PRODUCT_MODEL := anzu

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/semc/anzu/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

-include device/semc/msm7x30-common/msm7x30.mk

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    hostap

DISABLE_DEXPREOPT := false

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/anzu/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/semc/anzu/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/init.semc.rc:root/init.semc.rc \
    device/semc/anzu/prebuilt/ueventd.mogami.rc:root/ueventd.mogami.rc \
    device/semc/anzu/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/anzu/prebuilt/logo.rle:root/logo.rle \
    device/semc/anzu/prebuilt/bootrec:root/sbin/bootrec \
    device/semc/anzu/recovery.fstab:root/recovery.fstab 

#recovery resources
PRODUCT_COPY_FILES += \
    bootable/recovery/res/images/icon_clockwork.png:root/res/images/icon_clockwork.png \
    bootable/recovery/res/images/icon_error.png:root/res/images/icon_error.png \
    bootable/recovery/res/images/icon_installing.png:root/res/images/icon_installing.png \
    bootable/recovery/res/images/indeterminate1.png:root/res/images/indeterminate1.png \
    bootable/recovery/res/images/indeterminate2.png:root/res/images/indeterminate2.png \
    bootable/recovery/res/images/indeterminate3.png:root/res/images/indeterminate3.png \
    bootable/recovery/res/images/indeterminate4.png:root/res/images/indeterminate4.png \
    bootable/recovery/res/images/indeterminate5.png:root/res/images/indeterminate5.png \
    bootable/recovery/res/images/indeterminate6.png:root/res/images/indeterminate6.png \
    bootable/recovery/res/images/progress_empty.png:root/res/images/progress_empty.png \
    bootable/recovery/res/images/progress_fill.png:root/res/images/progress_fill.png


#WIFI modules and configs
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/semc/anzu/prebuilt/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    device/semc/anzu/modules/sdio.ko:root/modules/modules/sdio.ko \
    device/semc/anzu/modules/tiap_drv.ko:root/modules/tiap_drv.ko \
    device/semc/anzu/modules/tiwlan_drv.ko:root/modules/tiwlan_drv.ko

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
    wifi.interface=tiwlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density=240 \
    ro.sf.hwrotation=180 \
    keyguard.no_require_sim=true \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.checkjni=false \
    ro.opengles.version=131072  \
    ro.compcache.default=0 \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    BUILD_UTC_DATE=0

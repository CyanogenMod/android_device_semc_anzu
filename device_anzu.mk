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

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    hostap \
    librs_jni \
    gralloc.msm7x30 \
    overlay.default \
    gps.semc \
    lights.semc \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory


DISABLE_DEXPREOPT := false

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/anzu/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/semc/anzu/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/semc/anzu/prebuilt/gps.conf:system/etc/gps.conf 

# Init files
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/init.semc.rc:root/init.semc.rc \
    device/semc/anzu/ueventd.mogami.rc:root/ueventd.mogami.rc \
    device/semc/anzu/recovery.fstab:root/etcrec/recovery.fstab \
    device/semc/anzu/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/anzu/prebuilt/logo.rle:root/logo.rle \
    device/semc/anzu/prebuilt/bootrec:root/sbin/bootrec 


#Recovery TEST Files
# PRODUCT_COPY_FILES += \

#WIFI modules and configs
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/semc/anzu/prebuilt/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    device/semc/anzu/modules/sdio.ko:system/lib/modules/sdio.ko \
    device/semc/anzu/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko \
    device/semc/anzu/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

#offline charging animation
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/animations/charging_animation_01.png:system/semc/chargemon/data/charging_animation_01.png \
    device/semc/anzu/prebuilt/animations/charging_animation_02.png:system/semc/chargemon/data/charging_animation_02.png \
    device/semc/anzu/prebuilt/animations/charging_animation_03.png:system/semc/chargemon/data/charging_animation_03.png \
    device/semc/anzu/prebuilt/animations/charging_animation_04.png:system/semc/chargemon/data/charging_animation_04.png \
    device/semc/anzu/prebuilt/animations/charging_animation_05.png:system/semc/chargemon/data/charging_animation_05.png \
    device/semc/anzu/prebuilt/animations/charging_animation_06.png:system/semc/chargemon/data/charging_animation_06.png \
    device/semc/anzu/prebuilt/animations/charging_animation_07.png:system/semc/chargemon/data/charging_animation_07.png \
    device/semc/anzu/prebuilt/animations/charging_animation_blank.png:system/semc/chargemon/data/charging_animation_blank.png

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
    ro.kernel.android.checkjni=0 \
    ro.opengles.version=131072  \
    ro.compcache.default=0 \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    BUILD_UTC_DATE=0

# anzu uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

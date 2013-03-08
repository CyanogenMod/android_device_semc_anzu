# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/anzu/anzu-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/semc/anzu/overlay

$(call inherit-product, device/semc/mogami-common/mogami.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_AAPT_CONFIG := normal hdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Init files
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/anzu/prebuilt/pre_hw_config.sh:root/pre_hw_config.sh \
    device/semc/anzu/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/msm7x30-common/prebuilt/logo_H.rle:root/logo.rle

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    device/semc/anzu/recovery/bootrec-device:recovery/bootrec-device

# Device specific configs
PRODUCT_COPY_FILES += \
    device/semc/anzu/config/cy8ctma300_touch.idc:system/usr/idc/cy8ctma300_touch.idc \
    device/semc/anzu/config/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
    device/semc/anzu/config/msm_pmic_pwr_key.kl:system/usr/keylayout/msm_pmic_pwr_key.kl \
    device/semc/anzu/config/pm8058-keypad.kl:system/usr/keylayout/pm8058-keypad.kl \
    device/semc/anzu/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
    device/semc/anzu/config/als_curve.conf:system/etc/als_curve.conf \
    device/semc/anzu/config/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/semc/anzu/config/sensors.conf:system/etc/sensors.conf \
    device/semc/anzu/config/tiwlan.ini:system/etc/tiwlan.ini

$(call inherit-product, device/semc/msm7x30-common/prebuilt/resources-hdpi.mk)

# Device properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    com.qc.hdmi_out=false

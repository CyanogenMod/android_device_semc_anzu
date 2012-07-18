$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/anzu/anzu-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := anzu
PRODUCT_DEVICE := anzu
PRODUCT_MODEL := anzu

-include device/semc/mogami-common/mogami.mk

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/anzu/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/semc/anzu/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/anzu/prebuilt/pre_hw_config.sh:root/pre_hw_config.sh \
    device/semc/anzu/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/msm7x30-common/prebuilt/logo_H.rle:root/logo.rle \
    device/semc/anzu/prebuilt/bootrec-device:root/sbin/bootrec-device \
    device/semc/anzu/recovery.fstab:root/etc/recovery.fstab

# semc msm7x30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

-include device/semc/msm7x30-common/prebuilt/resources-hdpi.mk

#LCD DENSITY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    com.qc.hdmi_out=false

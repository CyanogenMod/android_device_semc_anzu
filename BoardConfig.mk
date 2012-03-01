-include device/semc/mogami-common/BoardConfigCommon.mk
-include vendor/semc/anzu/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/semc/anzu/include

SENSORS_COMPASS_AK897X := true
SENSORS_ACCEL_BMA150_INPUT := true
SENSORS_ACCEL_BMA250_INPUT := false
SENSORS_PROXIMITY_APDS970X := true
SENSORS_PRESSURE_BMP180 := false

HDMI_DUAL_DISPLAY := true
TARGET_HAVE_HDMI_OUT := true

TARGET_OTA_ASSERT_DEVICE := LT18i,LT18a,LT15i,LT15a,anzu

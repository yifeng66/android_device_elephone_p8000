$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/elephone/p8000/k05ts_a-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/elephone/p8000/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/elephone/p8000/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/recovery/init.recovery.mt6753.rc:root/init.recovery.mt6753.rc \
#    $(LOCAL_PATH)/rootdir/recovery.fstab:recovery.fstab
#    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \

PRODUCT_COPY_FILES_OVERRIDES += \
    recovery/root/ueventd.rc \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#PRODUCT_NAME := full_k05ts_a
#PRODUCT_DEVICE := k05ts_a

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
ro.adb.secure=0 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mtp \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no \
ro.cip.partition.support=no

#
# device.mk for Redmi Note 9 5G (cannon)
#

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# API level
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Recovery files - copy to recovery ramdisk root
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.mt6853.rc:recovery/root/init.recovery.mt6853.rc

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

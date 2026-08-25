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
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.1-impl-mock

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab.mt6853:$(TARGET_COPY_OUT_RECOVERY)/root/fstab.mt6853 \
    $(LOCAL_PATH)/recovery/init.recovery.mt6853.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6853.rc

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/handheld_core_hardware.xml

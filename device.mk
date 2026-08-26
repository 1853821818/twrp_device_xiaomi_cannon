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

# TWRP required modules - recovery main binary + relink chain
PRODUCT_PACKAGES += \
    recovery \
    qcom_decrypt \
    twrp_ramdisk \
    relink_binaries \
    relink_libraries \
    relink_vendor_hw_binaries \
    init_second_stage.recovery

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Properties
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop

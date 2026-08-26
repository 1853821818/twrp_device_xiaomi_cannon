LOCAL_PATH := $(call my-dir)

# Define dtb.img build rule - copy prebuilt dtb.img to product output
$(PRODUCT_OUT)/dtb.img: $(LOCAL_PATH)/prebuilt/dtb.img
	$(copy-file-to-target)

ALL_DEFAULT_INSTALLED_MODULES += $(PRODUCT_OUT)/dtb.img

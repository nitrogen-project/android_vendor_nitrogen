PRODUCT_COPY_FILES += \
    vendor/nitrogen/utils/emulator/fstab.ranchu:vendor/etc/fstab.ranchu \
    vendor/nitrogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, build/target/product/sdk_x86.mk)

$(call inherit-product, vendor/nitrogen/utils/emulator/common.mk)

# Override product naming for nitrogen
PRODUCT_NAME := nitrogen_emulator

DEVICE_PACKAGE_OVERLAYS += vendor/nitrogen/utils/emulator/overlay

ALLOW_MISSING_DEPENDENCIES := true 

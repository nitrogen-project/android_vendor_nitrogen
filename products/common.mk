# Generic product
PRODUCT_NAME := nitrogen
PRODUCT_BRAND := nitrogen
PRODUCT_DEVICE := generic

EXCLUDE_SYSTEMUI_TESTS := true

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(BUILD_ID)

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true \
    ro.config.calibration_cad=/system/etc/calibration_cad.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.nitrogen.version=$(PLATFORM_VERSION)-$(BUILD_ID)

# Disable HDCP check
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.nohdcp=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.service.adb.enable=1

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/nitrogen/overlay/common

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/nitrogen/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Latin IME lib - gesture typing
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# APN
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# AR
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/calibration_cad.xml:system/etc/calibration_cad.xml

# Extra packages
PRODUCT_PACKAGES += \
    DaylightHeaderNitrogen \
    Launcher3 \
    NitrogenWallpapers \
    OmniJaws \
    Stk \
    Terminal

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/nitrogen/prebuilt/common/init.d/00banner:system/etc/init.d/00banner \
    vendor/nitrogen/prebuilt/common/init.d/init.d.rc:root/init.d.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/addon.d/50-nitrogen.sh:system/addon.d/50-nitrogen.sh \
    vendor/nitrogen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/nitrogen/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

# Nitrogen OTA
#$(call inherit-product-if-exists, vendor/nitrogen/products/ota.mk)

# Boot animations
$(call inherit-product-if-exists, vendor/nitrogen/products/bootanimation.mk)

# Themes
$(call inherit-product-if-exists, vendor/nitrogen/products/themes.mk)
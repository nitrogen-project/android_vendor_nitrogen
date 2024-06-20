# Generic product
PRODUCT_NAME := nitrogen
PRODUCT_BRAND := nitrogen
PRODUCT_DEVICE := generic

NITROGEN_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.opa.eligible_device=true \
    ro.config.calibration_cad=/system/etc/calibration_cad.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.nitrogen.fingerprint=$(PLATFORM_VERSION)-$(BUILD_ID)-$(NITROGEN_BUILD_DATE)

# Common overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/nitrogen/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/nitrogen/overlay/common

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/nitrogen/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Latin IME lib - gesture typing
ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm64))
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/nitrogen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# APN
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# AR
PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/calibration_cad.xml:system/etc/calibration_cad.xml

#Build changelog
PRODUCT_PACKAGES += \
    Changelog.txt

# Extra packages
PRODUCT_PACKAGES += \
    Launcher3 \
    messaging \
    QuickAccessWallet \
    Stk \
    Terminal

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# NavigationBarMode
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# Face Unlock
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += \
    FaceUnlock \
    ParanoidSenseTranslation

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Priv-app config
PRODUCT_COPY_FILES += \
    vendor/nitrogen/config/permissions/privapp-permissions-nitrogen.xml:system/etc/permissions/privapp-permissions-nitrogen.xml

# Themes
PRODUCT_PACKAGES += \
    BlackTheme \
    ImmersiveNavigationOverlay \
    ThemePicker \
    ThemesStub \
    SystemUIClocks-BigNum \
    SystemUIClocks-Calligraphy \
    SystemUIClocks-Flex \
    SystemUIClocks-Growth \
    SystemUIClocks-Metro \
    SystemUIClocks-Inflate \
    SystemUIClocks-NumOverlap

# Smartspace
PRODUCT_PACKAGES += \
    DeviceIntelligenceNetworkPrebuilt \
    DevicePersonalizationPrebuiltPixel2021 \
    PixelConfigOverlayCommon

PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/permissions/privapp-permissions-google-as.xml:product/etc/permissions/privapp-permissions-google-as.xml \
    vendor/nitrogen/prebuilt/common/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml:product/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml

# Smartspace
PRODUCT_PACKAGES += \
    DeviceIntelligenceNetworkPrebuilt \
    DevicePersonalizationPrebuiltPixel2021 \
    PixelConfigOverlayCommon

PRODUCT_COPY_FILES += \
    vendor/nitrogen/prebuilt/common/etc/permissions/privapp-permissions-google-as.xml:product/etc/permissions/privapp-permissions-google-as.xml

# Default notification/alarm/ringtone sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg \
    ro.config.ringtone=Aquila.ogg

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/GooglePrintRecommendationService/GooglePrintRecommendationService.apk \
    system/etc/apns-conf.xml \
    system/etc/calibration_cad.xml \
    system/etc/permissions/android.hardware.biometrics.face.xml \
    system/etc/permissions/android.software.sip.voip.xml \
    system/etc/permissions/privapp-permissions-google-system.xml \
    system/etc/permissions/privapp-permissions-nitrogen.xml \
    system/etc/permissions/privapp-permissions-org.pixelexperience.faceunlock.xml \
    system/etc/sysconfig/dialer_experience.xml \
    system/etc/sysconfig/google-hiddenapi-package-allowlist.xml \
    system/etc/sysconfig/hiddenapi-whitelist-org.pixelexperience.faceunlock.xml \
    system/etc/sysconfig/preinstalled-packages-platform-full-base.xml \
    system/lib/libjni_latinimegoogle.so \
    system/lib64/faceunlock_vendor_dependencies.so \
    system/lib64/libFaceDetectCA.so \
    system/lib64/libMegviiUnlock-jni-1.2.so \
    system/lib64/libMegviiUnlock.so \
    system/lib64/libarcsoft-lib.so \
    system/lib64/libarcsoft_faceid.so \
    system/lib64/libarcsoftbase.so \
    system/lib64/libjni_latinimegoogle.so \
    system/lib64/libmegface.so \
    system/lib64/libmpbase.so \
    system/media/bootanimation.zip \
    system/priv-app/FaceUnlockService/FaceUnlockService.apk \
    system/priv-app/GooglePackageInstaller/GooglePackageInstaller.apk \
    system/priv-app/TagGoogle/TagGoogle.apk \
    system/bin/health \
    system/lib64/libcuttlefish_fs.so \
    system/lib64/libcuttlefish_utils.so \
    system/lib64/libfruit.so

# Boot animations
$(call inherit-product-if-exists, vendor/nitrogen/products/bootanimation.mk)

# Nitrogen OTA
#$(call inherit-product-if-exists, vendor/nitrogen/products/ota.mk)

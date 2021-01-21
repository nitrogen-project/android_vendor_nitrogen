PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += nitrogenVarsPlugin

SOONG_CONFIG_nitrogenVarsPlugin :=

define addVar
  SOONG_CONFIG_nitrogenVarsPlugin += $(1)
  SOONG_CONFIG_nitrogenVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef


$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += nitrogenGlobalVars
SOONG_CONFIG_nitrogenGlobalVars += \
    target_inputdispatcher_skip_event_key

ifneq ($(TARGET_USE_QTI_BT_STACK),true)
PRODUCT_SOONG_NAMESPACES += packages/apps/Bluetooth
endif #TARGET_USE_QTI_BT_STACK

# Set default values
TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY ?= 0

# Soong value variables
SOONG_CONFIG_nitrogenGlobalVars_target_inputdispatcher_skip_event_key := $(TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY)
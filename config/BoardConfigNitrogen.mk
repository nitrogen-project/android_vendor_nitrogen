include vendor/nitrogen/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/nitrogen/config/BoardConfigQcom.mk
endif

include vendor/nitrogen/config/BoardConfigSoong.mk

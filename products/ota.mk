# Copyright (C) 2016 Nitrogen Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(filter nitrogen_angler,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/angler.xml

endif

ifneq ($(filter nitrogen_geehrc,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/geehrc.xml

endif

ifneq ($(filter nitrogen_geeb,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/geeb.xml

endif

ifneq ($(filter nitrogen_mako,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/mako.xml

endif

ifneq ($(filter nitrogen_hammerhead,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/hammerhead.xml

endif

ifneq ($(filter nitrogen_bullhead,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/bullhead.xml

endif

ifneq ($(filter nitrogen_bacon,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/bacon.xml

endif

ifneq ($(filter nitrogen_shamu,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/shamu.xml

endif

ifneq ($(filter nitrogen_kenzo,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/kenzo_new.xml

endif

ifneq ($(filter nitrogen_sprout4,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/sprout4.xml

endif

ifneq ($(filter nitrogen_sprout8,$(TARGET_PRODUCT)),)

    PRODUCT_PACKAGES += \
        NitrogenOTA \
        libbypass

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=Nitrogen-OS \
        ro.ota.version=$(shell date +"%Y%m%d") \
        ro.ota.manifest=http://xyyx-dev.ru/nitrogen-os/nougat/sprout8.xml

endif

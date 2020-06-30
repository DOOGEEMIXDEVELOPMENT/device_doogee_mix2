#
# Copyright (C) 2016 The CyanogenMod Project
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
#

# Release name
PRODUCT_RELEASE_NAME := mix2

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/doogee/mix2/device_mix2.mk)
# $(call inherit-product, device/doogee/mix2/prop.mk)

TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mix2
PRODUCT_NAME := lineage_mix2
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := DOOGEE MIX 2
PRODUCT_MANUFACTURER := DOOGEE

# Google client ID property.
PRODUCT_GMS_CLIENTID_BASE := android-DOOGEE


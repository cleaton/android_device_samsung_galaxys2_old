# Copyright (C) 2012 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Get the long list of APNs
PRODUCT_COPY_FILES := \
		device/samsung/galaxys2/configs/apns-conf.xml:system/etc/apns-conf.xml \
		device/samsung/galaxys2/configs/spn-conf.xml:system/etc/spn-conf.xml
# Enable debugable even on non debug builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/samsung/galaxys2/galaxys2.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_galaxys2
PRODUCT_DEVICE := galaxys2
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9100

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9100 BUILD_DISPLAY_ID=IMM76D BUILD_FINGERPRINT=samsung/GT-I9100/GT-I9100:4.0.3/IML74K/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-I9100-user 4.0.3 IML74K XXLPQ release-keys"

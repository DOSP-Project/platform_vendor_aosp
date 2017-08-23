# Copyright (C) 2016 The DOSPTeam
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

# Inherit AOSP device configuration for jflte
$(call inherit-product, device/samsung/jflte/aosp_jflte.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := DOSP_jflte
PRODUCT_DEVICE := jflte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := Samsung Galaxy S4

DEVICE_MAINTAINERS := Kukun7610

WITH_ROOT := true

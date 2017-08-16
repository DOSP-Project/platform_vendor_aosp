# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
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

#DOSP-OS Versioning
 DOSP_VERSION = 1.0
 
 ifndef DOSP_BUILD_TYPE
 DOSP_BUILD_TYPE := UNOFFICIAL
  endif		 
  		 
 DOSP_MOD_VERSION := DOSP-OS-$(DOSP_VERSION)-$(DOSP_BUILD)-$(shell date -u +%Y%m%d)-$(DOSP_BUILD_TYPE)
 
 PRODUCT_PROPERTY_OVERRIDES += \
  ro.dosp.version=$(DOSP_VERSION) \
  ro.dosp.releasetype=$(DOSP_BUILD_TYPE) \
  ro.mod.version=$(DOSP_BUILD_TYPE)-$(DOSP_VERSION)
 
 OSMIUM_DISPLAY_VERSION := $(DOSP_MOD_VERSION)
  		  
  	 PRODUCT_PROPERTY_OVERRIDES += \
  		 ro.dosp.display.version=$(DOSP_DISPLAY_VERSION)
View  
3  osmium.devices

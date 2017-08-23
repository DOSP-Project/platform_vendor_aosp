# Inherit common AOSP stuff
$(call inherit-product, vendor/dosp/config/common.mk)

$(call inherit-product, vendor/dosp/config/telephony.mk)

$(call inherit-product, vendor/dosp/config/dosp_props.mk)

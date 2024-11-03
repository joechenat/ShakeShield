export PACKAGE_VERSION := 1.0

TARGET := iphone:clang:16.5:14.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := ShakeShield

ShakeShield_FILES += ShakeShield.x
ShakeShield_CFLAGS += -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
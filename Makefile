TWEAK_NAME = Moustache

Moustache_FILES = main.mm
Moustache_FRAMEWORKS = UIKit Foundation

Moustache_CFLAGS = -fobjc-arc

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

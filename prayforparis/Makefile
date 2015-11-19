include /var/theos/makefiles/common.mk

BUNDLE_NAME = PrayForParis
PrayForParis_FILES = PrayForParis.mm 
PrayForParis_INSTALL_PATH = /Library/PreferenceBundles
PrayForParis_FRAMEWORKS = UIKit Social
PrayForParis_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/Application\ Support/PrayForParis/$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/PrayForParis.plist$(ECHO_END)

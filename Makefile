include /var/theos/makefiles/common.mk

TWEAK_NAME = PrayForParis
PrayForParis_FILES = Tweak.xm
PrayForParis_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += prayforparis
include $(THEOS_MAKE_PATH)/aggregate.mk

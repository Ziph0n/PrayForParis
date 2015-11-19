@interface SBLockScreenView : UIView
@end

SBLockScreenView* _lsView = nil;
static bool visible = FALSE;

%hook SBLockScreenView

- (void)setCustomSlideToUnlockText:(id)arg1 {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.prayforparis.plist"];
	NSInteger language = [[prefs objectForKey:@"language"] intValue];
	BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
	
	if (enabled) {
		if (language==1) {
			arg1 = @"11/13/2015 - #PrayForParis";
			%orig(arg1);	
		} else if (language==2){
			arg1 = @"13/11/2015 - #PrayForParis";
			%orig(arg1);
		}
	}
}

-(id)initWithFrame:(CGRect)arg1 {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.prayforparis.plist"];
	BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
	if (enabled) {
	    id r = %orig;
	    if (r) {
	        _lsView = r;
	        visible = FALSE;
	    }
	    return r;
	} else {
		return %orig;
	}
}

- (void)layoutSubviews {
	%orig;
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.prayforparis.plist"];
	BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
	if (enabled) {
		UIImageView* paris = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/PrayForParis/paris.png"]];
		paris.center = _lsView.center;
	    paris.alpha = 1.0;
	    paris.tag = 598082824;
	    if (visible == FALSE) {
			[_lsView insertSubview:paris atIndex:0];
			visible = TRUE;
		}
	}
}

%end
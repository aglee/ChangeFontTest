#  ChangeFontTest

[TL;DR: see the class comments in AppDelegate.h.]

Trying to confirm whether `NSFontPanel` does indeed tell `NSFontManager` to send a `changeFont:` message to the first responder.  This is my understanding from the docs.

I'm wondering because of [this tweet](https://twitter.com/AndyyHope/status/1155152456583507968).

The archived ["Using the Font Panel"](https://developer.apple.com/library/archive/documentation/TextFonts/Conceptual/CocoaTextArchitecture/FontHandling/FontHandling.html#//apple_ref/doc/uid/TP40009459-CH5-SW4) doc says that by default `NSFontManager` sends `changeFont:` to the first responder when you pick a font in `NSFontPanel`.  The [`NSFontManager` doc](https://developer.apple.com/documentation/appkit/nsfontmanager/1462349-action) says you can change `NSFontManager` to send a different action message, though it's unlikely you'll want to.


## Notes

Looks like `changeFont:` does in fact get called by default, at least on Mojave, and seemingly on Catalina.

Looks like it does work to change `NSFontManager`'s action to something else.  In this case I added an `appSpecificChangeFont:` method to the app delegate, and tweaked `NSFontManager` to use that as its action.  All it does is an NSLog followed by sending `changeFont:` to the first responder.  One could put any other custom behavior in there.

Offhand I feel like I'd like to subclass `NSFontManager` and override `sendAction:` to do whatever custom thing I want and then call super.  But I don't see a way to force a custom `NSFontManager` subclass to be used.



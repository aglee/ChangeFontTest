#  ChangeFontTest

Trying to confirm whether NSFontPanel (still) tells NSFontManager to send a `changeFont:` message to the first responder.

I'm wondering because of [this tweet](https://twitter.com/AndyyHope/status/1155152456583507968).

[This](https://developer.apple.com/library/archive/documentation/TextFonts/Conceptual/CocoaTextArchitecture/FontHandling/FontHandling.html#//apple_ref/doc/uid/TP40009459-CH5-SW4) says that by default NSFontManager sends `changeFont:` to the FR when you pick a font in NSFontPanel.  The [NSFontManager doc](https://developer.apple.com/documentation/appkit/nsfontmanager/1462349-action) says you can change NSFontManager to send a different action message, but it's unlikely you'll want to.


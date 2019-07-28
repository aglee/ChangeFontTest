//
//  AppDelegate.h
//  ChangeFontTest
//
//  Created by Andy Lee on 7/28/19.
//  Copyright © 2019 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 * Application delegate.
 *
 * The key things to look for in the code:
 *
 * - On launch, we tweak `NSFontManager` to use a custom action selector when the user
 *   makes a change in the font panel.  The selector is `appSpecificChangeFont:`.
 *
 * - The app delegate implements `appSpecificChangeFont:` to first do some custom stuff,
 *   then perform the default font-change behavior (possibly nothing) by sending
 *   `changeFont:` to the first responder.
 */
@interface AppDelegate : NSObject <NSApplicationDelegate>
@end


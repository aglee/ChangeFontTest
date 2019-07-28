//
//  AppDelegate.m
//  ChangeFontTest
//
//  Created by Andy Lee on 7/28/19.
//  Copyright © 2019 Andy Lee. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end



@implementation AppDelegate

#pragma mark - Action methods

- (IBAction)changeFont:(id)sender {
	NSLog(@"changeFont: called in %@", self.className);
}

/**
 * On launch we tweak NSFontManager to send this message whenever the user makes a change
 * in the font panel.
 */
- (IBAction)appSpecificChangeFont:(id)sender {
	NSLog(@"appSpecificChangeFont: called in %@", self.className);

	// Note: the BOOL return value is discarded.  Seems like a possible minor flaw in this
	// approach, as -[NSFontManager sendAction:] will always return YES, which may not
	// technically be the answer we want if nothing on the responder chain responds to
	// `changeFont:`.  But in practice maybe we don't care.
	(void)[NSApp sendAction:@selector(changeFont:) to:nil from:sender];
}

- (IBAction)makeSenderTheFirstResponder:(id)sender {
	[self.window makeFirstResponder:sender];
}

- (IBAction)clearFirstResponder:(id)sender {
	[self.window makeFirstResponder:nil];
}

/**
 * FIXME: Doesn't print the full responder chain.
 *
 * Starts with current FR and follows `nextResponder` until it hits nil.  This is good
 * enough for my quick and dirty purposes, but IIRC the full responder chain includes the
 * app delegate, the NSApp object, and possibly other stuff.  I'm too lazy to look at the
 * event handling docs right now.
 */
- (IBAction)printResponderChain:(id)sender {
	NSResponder *resp = NSApp.keyWindow.firstResponder;
	NSLog(@"---- BEGIN incomplete responder chain");
	do {
		NSLog(@"%@ -- implements changeFont:? %d", resp.className, [resp respondsToSelector:@selector(changeFont:)]);
		resp = resp.nextResponder;
	} while (resp);
	NSLog(@"---- END");
}

#pragma mark - <NSApplicationDelegate> methods

- (void)applicationDidFinishLaunching:(NSNotification *)notification {

	// Normally when a font is selected in the font panel, NSFontManager sends a
	// `changeFont:` message to the first responder.  Here we tweak NSFontManager to
	// instead send an `appSpecificChangeFont:` message.  Presumably this app delegate
	// will be the only object in the responder chain that responds to the message.
	NSFontManager.sharedFontManager.action = @selector(appSpecificChangeFont:);

	// Display the font panel as a convenience.
	[NSFontManager.sharedFontManager orderFrontFontPanel:nil];
}

@end

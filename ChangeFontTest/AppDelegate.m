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
 * enough for my quick and dirty purposes, but the full responder chain includes window
 * delegate, app delegate, NSApp, and whatnot.  I'm too lazy to look at the event handling
 * docs right now.
 */
- (IBAction)printResponderChain:(id)sender {
	NSResponder *resp = NSApp.keyWindow.firstResponder;
	NSLog(@"---- BEGIN responder chain");
	do {
		NSLog(@"%@ -- implements changeFont:? %d", resp.className, [resp respondsToSelector:@selector(changeFont:)]);
		resp = resp.nextResponder;
	} while (resp);
	NSLog(@"----END responder chain");
}

#pragma mark - <NSApplicationDelegate> methods

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	[NSFontManager.sharedFontManager orderFrontFontPanel:nil];
}

@end

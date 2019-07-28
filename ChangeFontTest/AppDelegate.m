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

- (IBAction)xxxchangeFont:(id)sender {
	NSLog(@"changeFont: called in %@", self.className);
}

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

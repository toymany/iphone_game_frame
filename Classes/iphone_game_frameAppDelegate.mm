//
//  iphone_game_frameAppDelegate.m
//  iphone_game_frame
//
//  Created by 山屋 健 on 10/04/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "iphone_game_frameAppDelegate.h"
#import "EAGLView.h"

@implementation iphone_game_frameAppDelegate

@synthesize window;
@synthesize glView;

- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	[glView startAnimation];
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	[glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) dealloc
{
	[window release];
	[glView release];
	
	[super dealloc];
}

@end

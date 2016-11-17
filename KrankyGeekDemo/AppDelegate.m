//
//  AppDelegate.m
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import "AppDelegate.h"

#import <WebRTC/RTCSSLAdapter.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // One time initialization of SSL Library
    RTCInitializeSSL();
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Deinitialization of SSL library
    RTCCleanupSSL();
}


@end

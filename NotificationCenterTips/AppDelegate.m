//
//  AppDelegate.m
//  NotificationCenterTips
//
//  Created by FengYinghao on 12/28/15.
//  Copyright © 2015 FengYinghao. All rights reserved.
//

#import "AppDelegate.h"
#import "NotifyTip.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)triggerDock:(id)sender {
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d",i];
    [[NotifyTip sharedNotifyTip] showNotificaitonInDock:strTip];
    i++;
}

- (IBAction)triggerNotificationCenter:(id)sender {
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d",i];
    [[NotifyTip sharedNotifyTip] showUserNotificationTitle:@"Notification"
                                              withSubTitle:@"Details"
                                       withInformativeText:strTip];
    i++;
}

@end

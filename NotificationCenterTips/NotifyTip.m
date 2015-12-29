//
//  NotifyTip.m
//  NotificationCenterTips
//
//  Created by FengYinghao on 12/28/15.
//  Copyright © 2015 FengYinghao. All rights reserved.
//

#import "NotifyTip.h"
#import <AppKit/AppKit.h>

@implementation NotifyTip

@synthesize delegate;

+ (NotifyTip*)sharedNotifyTip {
    static NotifyTip *_sharedNotifyTip = nil;
    if (_sharedNotifyTip == nil) {
        _sharedNotifyTip = [[self alloc]init];
    }
    return _sharedNotifyTip;
}


- (void)showUserNotificationTitle:(NSString*)title
                     withSubTitle:(NSString*)subTitle
              withInformativeText:(NSString*)informativeText {
    
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    [notification setTitle:title];
    [notification setSubtitle:subTitle];
    [notification setInformativeText:informativeText];
    
    NSUserNotificationCenter *userNotificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    userNotificationCenter.delegate = self;
    [userNotificationCenter scheduleNotification:notification];
}

- (void)showNotificaitonInDock:(NSString*)informativeText {
    [[[NSApplication sharedApplication] dockTile] setBadgeLabel:informativeText];
}


#pragma mark NSUserNotificationCenterDelegate
- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification {
    return YES;
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification {
    if (delegate && [delegate respondsToSelector:@selector(userNotificationCenter:didActivateNotification:)] == YES) {
        [delegate userNotificationCenter:center didActivateNotification:notification];
    }
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification {
    if (delegate && [delegate respondsToSelector:@selector(userNotificationCenter:didDeliverNotification:)] == YES) {
        [delegate userNotificationCenter:center didDeliverNotification:notification];
    }
}


@end

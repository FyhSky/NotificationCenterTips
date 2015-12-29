//
//  NotifyTip.h
//  NotificationCenterTips
//
//  Created by FengYinghao on 12/28/15.
//  Copyright © 2015 FengYinghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotifyTipDelegate <NSObject>

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification;

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification ;

@end

/**
 *  @brief  NotifyTip
 *  @note
 *  消息提示：包括用户中心提示，以及dock提示
 */

@interface NotifyTip : NSObject <NSUserNotificationCenterDelegate>

+ (NotifyTip*)sharedNotifyTip;

@property (assign) id<NotifyTipDelegate>delegate;

- (void)showUserNotificationTitle:(NSString*)title
                     withSubTitle:(NSString*)subTitle
              withInformativeText:(NSString*)informativeText;

- (void)showNotificaitonInDock:(NSString*)informativeText;

@end

//
//  CallViewController.h
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallView.h"

@class CallViewController;
@protocol CallViewControllerDelegate <NSObject>
- (void)viewControllerDidFinish:(CallViewController *)viewController;
@end


@interface CallViewController : UIViewController

@property(nonatomic, weak) id<CallViewControllerDelegate> delegate;
@property NSString *roomName;

-(void)setRoom:(NSString *)room delegate:(id<CallViewControllerDelegate>)delegate;
-(void)videoCallViewDidHangup:(CallView *)view;

@end

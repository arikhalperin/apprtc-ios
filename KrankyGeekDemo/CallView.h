//
//  CallView.h
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoView.h"
@class CallView;
@protocol CallViewDelegate<NSObject>
-(void)videoCallViewDidHangup:(CallView *)view;
@end

@interface CallView : VideoView
@property(nonatomic, readwrite) UILabel * statusLabel;
@property(nonatomic, weak) id<CallViewDelegate> delegate;
@property(nonatomic, readwrite)  CallView * callView;
@end

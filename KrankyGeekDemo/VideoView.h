//
//  VideoView.h
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebRTC/RTCEAGLVideoView.h"

@interface VideoView : UIView<RTCEAGLVideoViewDelegate>

@property(nonatomic, readonly) NSObject *localVideoView;
@property(nonatomic, readonly) NSObject *remoteVideoView;
-(void)setLocalViewSize: (int)left topPercent:(int)top widthPercent:(int)width heightPercent:(int)height;
-(void)setRemoteViewSize: (int)left topPercent:(int)top widthPercent:(int)width heightPercent:(int)height;
-(void)showLocal: (BOOL)enable;
-(void)showRemote: (BOOL)enable;
-(void)setLocalAboveRemote: (BOOL)above;
@end

//
//  VideoBaseView.m
//  IosDialer
//
//  Created by arik halperin on 6/21/15.
//  Copyright (c) 2015 softskills. All rights reserved.
//

#import "VideoView.h"

#import <AVFoundation/AVFoundation.h>
#import "RTCEAGLVideoView.h"
#import "RTCVideoTrack.h"



@implementation VideoView {
    CGSize _localVideoSize;
    CGSize _remoteVideoSize;
    int _localLeft;
    int _localTop;
    int _localWidth;
    int _localHeight;
    int _remoteLeft;
    int _remoteTop;
    int _remoteWidth;
    int _remoteHeight;
    bool _localAboveRemote;
}

@synthesize localVideoView = _localVideoView;
@synthesize remoteVideoView = _remoteVideoView;


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _remoteVideoView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectZero];
        ((RTCEAGLVideoView *)_remoteVideoView).delegate = self;
        [self addSubview:(UIView *)_remoteVideoView];
        
        // TODO(tkchin): replace this with a view that renders layer from
        // AVCaptureSession.
        _localVideoView = [[RTCEAGLVideoView alloc] initWithFrame:CGRectZero];
        ((RTCEAGLVideoView *)_localVideoView).delegate = self;
        [self addSubview:(UIView *)_localVideoView];
        [self setRemoteViewSize:0 topPercent:0 widthPercent:100 heightPercent:100];
        [self setLocalViewSize:50 topPercent:70 widthPercent:50 heightPercent:30];
        
        _localAboveRemote = YES;
    }
    return self;
}

-(void)showRemote: (BOOL)enable {
    ((UIView *)_remoteVideoView).hidden = enable?NO:YES;
}


-(void)showLocal: (BOOL)enable {
    ((UIView *)_localVideoView).hidden = enable?NO:YES;
}

- (void)layoutSubviews {
    CGRect bounds = self.bounds;
    float width = bounds.size.width;
    float height = bounds.size.height;
    float remoteOriginX = width*_remoteLeft/100.;
    float remoteOriginY = height*_remoteTop/100;
    float remoteWidth = _remoteWidth*width/100.;
    float remoteHeight = _remoteHeight*height/100.;
    float localOriginX = width*_localLeft/100.;
    float localOriginY = height*_localTop/100;
    float localWidth = _localWidth*width/100.;
    float localHeight = _localHeight*height/100.;
    
    CGRect boundForRemoteVideo = CGRectMake(remoteOriginX,remoteOriginY,remoteWidth,remoteHeight);
    CGRect boundForLocalVideo = CGRectMake(localOriginX,localOriginY,localWidth,localHeight);
    
    
    
    if (_remoteVideoSize.width > 0 && _remoteVideoSize.height > 0) {
        // Aspect fill remote video into bounds.
        CGRect remoteVideoFrame =
        AVMakeRectWithAspectRatioInsideRect(_remoteVideoSize, boundForRemoteVideo);
         ((UIView *)_remoteVideoView).frame = remoteVideoFrame;
    }
    
    
    if (_localVideoSize.width > 0 && _localVideoSize.height > 0) {
        // Aspect fill remote video into bounds.
        CGRect localVideoFrame =
        AVMakeRectWithAspectRatioInsideRect(_localVideoSize, boundForLocalVideo);
        ((UIView *)_localVideoView).frame = localVideoFrame;
    }
    
    
}

#pragma mark - RTCEAGLVideoViewDelegate

- (void)videoView:(RTCEAGLVideoView*)videoView didChangeVideoSize:(CGSize)size {
    if (videoView == _localVideoView) {
        _localVideoSize = size;
        ((UIView *)_localVideoView).hidden = CGSizeEqualToSize(CGSizeZero, _localVideoSize);
    } else if (videoView == _remoteVideoView) {
        _remoteVideoSize = size;
    }
    [self setNeedsLayout];
}

-(void)setLocalAboveRemote:(BOOL)localAbove {
    NSUInteger localIndex = [[self subviews] indexOfObject:(UIView *)_localVideoView];
    NSUInteger remoteIndex = [[self subviews] indexOfObject:(UIView *)_remoteVideoView];
    
    if(localAbove!=_localAboveRemote) {
        [self exchangeSubviewAtIndex:localIndex withSubviewAtIndex:remoteIndex];
        _localAboveRemote = localAbove;
    }
}


-(void)setLocalViewSize:(int)left topPercent:(int)top widthPercent:(int)width heightPercent:(int)height {
    _localLeft = left;
    _localTop = top;
    _localWidth = width;
    _localHeight = height;
    [self setNeedsLayout];
}

-(void)setRemoteViewSize:(int)left topPercent:(int)top widthPercent:(int)width heightPercent:(int)height {
    _remoteLeft = left;
    _remoteTop = top;
    _remoteWidth = width;
    _remoteHeight = height;
    [self setNeedsLayout];
}


@end

//
//  CallView.m
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import "CallView.h"
#import <AVFoundation/AVFoundation.h>



static CGFloat const kButtonPadding = 16;
static CGFloat const kButtonSize = 48;


@implementation CallView {
    UIButton *_hangupButton;
    CGSize _remoteVideoSize;
    BOOL _useRearCamera;
}

@synthesize statusLabel = _statusLabel;
@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //Prepare the hangup button and status label
        _hangupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hangupButton.backgroundColor = [UIColor redColor];
        _hangupButton.layer.cornerRadius = kButtonSize / 2;
        _hangupButton.layer.masksToBounds = YES;
        UIImage * image = [UIImage imageNamed:@"ic_call_end_black_24dp.png"];
        [_hangupButton setImage:image forState:UIControlStateNormal];
        [_hangupButton addTarget:self
                          action:@selector(onHangup:)
                forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_hangupButton];
        
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _statusLabel.font = [UIFont fontWithName:@"Roboto" size:16];
        _statusLabel.textColor = [UIColor whiteColor];
        [self addSubview:_statusLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    
    // Place hangup button in the bottom left.
    _hangupButton.frame =
    CGRectMake(CGRectGetMinX(bounds) + kButtonPadding,
               CGRectGetMaxY(bounds) - kButtonPadding -
               kButtonSize,
               kButtonSize,
               kButtonSize);
    
    [_statusLabel sizeToFit];
    _statusLabel.center =
    CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}

#pragma mark - RTCEAGLVideoViewDelegate

- (void)videoView:(RTCEAGLVideoView*)videoView didChangeVideoSize:(CGSize)size {
    [super videoView:videoView didChangeVideoSize:size];
    [self setNeedsLayout];
}

#pragma mark - Private


- (void)onHangup:(id)sender {
    [_delegate videoCallViewDidHangup:self];
}

@end

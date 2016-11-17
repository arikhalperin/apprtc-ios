//
//  CallViewController.m
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import "CallViewController.h"
#import "WebRTC/ARDAppClient.h"
#import "CallView.h"
#import "RTCAVFoundationVideoSource.h"

@interface CallViewController () <ARDAppClientDelegate,CallViewDelegate>
@property(nonatomic, readonly) CallView *callView;
@property (strong, nonatomic) RTCVideoTrack *localVideoTrack;
@property (strong, nonatomic) RTCVideoTrack *remoteVideoTrack;
@end

@implementation CallViewController{
    ARDAppClient *_client;
    CallView * _callView;
}


@synthesize callView = _callView;


-(void)setRoom:(NSString *)room delegate:(id<CallViewControllerDelegate>)delegate {
    _roomName = room;
    _delegate = delegate;
    
    //Create a jingle client
    _client = [[ARDAppClient alloc] initWithDelegate:self];
    
    
    //Set the server URL
    [_client setServerUrl:@"https://apprtc.appspot.com"];
    
    //Connect to the room
    [_client connectToRoomWithId:_roomName];
}

- (NSString *)statusTextForState:(RTCIceConnectionState)state {
    switch (state) {
        case RTCIceConnectionStateNew:
            return @"Connecting...";
       default:
            return nil;
    }
}


-(void)loadView {
    //Create the call view
    _callView = [[CallView alloc] initWithFrame:CGRectZero];
    _callView.delegate = self;
    _callView.statusLabel.text = [self statusTextForState:RTCIceConnectionStateNew];
    self.view = _callView;
}

#pragma mark - ARDAppClientDelegate

- (void)appClient:(ARDAppClient *)client
   didChangeState:(ARDAppClientState)state {
    switch (state) {
        case kARDAppClientStateConnected:
            NSLog(@"Client connected.");
            break;
        case kARDAppClientStateConnecting:
            NSLog(@"Client connecting.");
            break;
        case kARDAppClientStateDisconnected:
            NSLog(@"Client disconnected.");
            [self hangup];
            break;
    }
}

-(void)appClient:(ARDAppClient *)client didError:(NSError *)error {
    NSLog(@"Got error:%@",error.description);
}

- (void)appClient:(ARDAppClient *)client
didChangeConnectionState:(RTCIceConnectionState)state {
    NSLog(@"ICE state changed: %ld", (long)state);
    __weak CallViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        CallViewController *strongSelf = weakSelf;
        strongSelf.callView.statusLabel.text =
        [strongSelf statusTextForState:state];
    });
}

- (void)appClient:(ARDAppClient *)client
didReceiveLocalVideoTrack:(RTCVideoTrack *)localVideoTrack {
    self.localVideoTrack = localVideoTrack;
    [self.localVideoTrack addRenderer:(id<RTCVideoRenderer>)self.callView.localVideoView];
}

- (void)appClient:(ARDAppClient *)client
didReceiveRemoteVideoTrack:(RTCVideoTrack *)remoteVideoTrack {
    self.remoteVideoTrack = remoteVideoTrack;
    [self.remoteVideoTrack addRenderer:(id<RTCVideoRenderer>)self.callView.remoteVideoView];
    _callView.statusLabel.hidden = YES;
}


#pragma mark - ARDVideoCallViewDelegate

- (void)videoCallViewDidHangup:(CallView *)view {
    [self hangup];
}

- (void)hangup {
    self.remoteVideoTrack = nil;
    self.localVideoTrack = nil;
    [_client disconnect];
    [_delegate viewControllerDidFinish:self];
}


@end

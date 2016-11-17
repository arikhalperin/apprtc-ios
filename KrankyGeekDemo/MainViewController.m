//
//  MainViewController.m
//  KrankyGeekDemo
//
//  Created by arik halperin on 31/10/2016.
//  Copyright © 2016 arik halperin. All rights reserved.
//

#import "MainViewController.h"
#import "CallViewController.h"

@interface MainViewController ()<CallViewControllerDelegate>


@end

@implementation MainViewController


- (IBAction)onStartCall:(id)sender {
    //Start the call
    [self performSegueWithIdentifier:@"StartCall" sender:self];
}

-(void)viewControllerDidFinish:(CallViewController *)viewController {
    //After hangup remove the call view
    [viewController dismissViewControllerAnimated:true completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Starting the call, get room name and set in call view controller
    NSString *room = _roomNumber.text;
    // If this is a loopback call, allow a generated room name.
    if (!room.length) {
        room = [[NSUUID UUID] UUIDString];
    }
    
    [(CallViewController *)segue.destinationViewController setRoom:room delegate:self];
}


@end

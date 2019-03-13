//
//  GSManager.m
//  getstart
//
//  Created by Mabel Lou on 3/12/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSManager.h"
#import "AppDelegate.h"

@implementation GSManager

RCT_EXPORT_MODULE(GSManager);

RCT_EXPORT_METHOD(presentGS) {
  dispatch_async(dispatch_get_main_queue(), ^{
    GSViewController *controller = [GSViewController loadInstanceFromNib];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.window.rootViewController presentViewController:controller animated:NO completion:nil];
  });
}

//pragma mark private methods
void hideGS() {
  AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [delegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

@end

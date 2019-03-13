//
//  GStreamerBackendDelegate.h
//  getstart
//
//  Created by Mabel Lou on 3/12/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GStreamerBackendDelegate <NSObject>

@optional
/* Called when the GStreamer backend has finished initializing
 * and is ready to accept orders. */
-(void) gstreamerInitialized;

/* Called when the GStreamer backend wants to output some message
 * to the screen. */
-(void) gstreamerSetUIMessage:(NSString *)message;

@end


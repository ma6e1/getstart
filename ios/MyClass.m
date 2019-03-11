//
//  MyClass.m
//  getstart
//
//  Created by Mabel Lou on 3/11/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport {
  return @{@"greeting": @"test native module"};
}

RCT_EXPORT_METHOD(squareMe:(int)number:(RCTResponseSenderBlock)callback) {
  callback(@[[NSNull null], [NSNumber numberWithInt:(number*number)]]);
}

@end

//
//  SwiftExceptionCatcher.h
//  SwiftExceptionCatcher
//
//  Created by Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

#ifndef SwiftExceptionCatcher
#define SwiftExceptionCatcher

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//! Project version number for SwiftExceptionCatcher.
FOUNDATION_EXPORT double SwiftExceptionCatcherVersionNumber;

//! Project version string for SwiftExceptionCatcher.
FOUNDATION_EXPORT const unsigned char SwiftExceptionCatcherVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SwiftExceptionCatcher/PublicHeader.h>


void tryOperation(void(^tryBlock)(), void(^catchBlock)(NSException *e));

#endif
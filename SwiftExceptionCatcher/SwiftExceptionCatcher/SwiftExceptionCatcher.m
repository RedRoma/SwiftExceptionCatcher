//
//  TryOperation.m
//  SwiftExceptionCatcher
//
//  Created by Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SwiftExceptionCatcher.h"

void tryOperation(void (^tryBlock)(), void(^catchBlock)(NSException *e)) {
    
    @try {
        tryBlock();
    }
    @catch (NSException *exception) {
        catchBlock(exception);
    }
}

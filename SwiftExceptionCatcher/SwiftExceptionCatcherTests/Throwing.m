//
//  Throwing.m
//  SwiftExceptionCatcher
//
//  Created by Wellington Moreno on 4/4/16.
//  Copyright © 2019 RedRoma, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Throwing.h"

@implementation Throwing

+ (void) functionThatThrows
{
    @throw [NSException exceptionWithName:@"Test" reason:@"" userInfo:nil];
}

+ (void) functionNotThrowing
{
    
}

@end

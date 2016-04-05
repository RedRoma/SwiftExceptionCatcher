//
//  Throwing.m
//  SwiftExceptionCatcher
//
//  Created by Juan Wellington Moreno on 4/4/16.
//  Copyright © 2016 RedRoma, Inc. All rights reserved.
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
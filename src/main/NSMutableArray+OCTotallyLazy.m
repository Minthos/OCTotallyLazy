//
//  NSMutableArray+OCTotallyLazy.m
//  OCTotallyLazy
//
//  Created by Espen Overaae on 6/28/13.
//
//

#import "NSMutableArray+OCTotallyLazy.h"

@implementation NSMutableArray (OCTotallyLazy)


- (NSMutableArray *)cat:(NSArray *)b
{
    [self addObjectsFromArray:b];
    return self;
}


@end

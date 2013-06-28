//
//  NSMutableArray+OCTotallyLazy.h
//  OCTotallyLazy
//
//  Created by Espen Overaae on 6/28/13.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (OCTotallyLazy)

- (NSMutableArray *)cat:(NSArray *)b; // same as join, but faster and less generic

@end

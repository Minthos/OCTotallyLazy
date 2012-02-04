#import "NSArray+Funcky.h"
#import "Some.h"
#import "None.h"

@implementation NSArray (Functional)

- (NSArray *)filter:(BOOL (^)(id))filterBlock {
    return [[Enumerations with:self.objectEnumerator] filter:filterBlock];
}

- (NSArray *)flatMap:(id (^)(id))functorBlock {
    return [[Enumerations with:[self objectEnumerator]] flatMap:functorBlock];
}

- (id)fold:(id)value with:(id (^)(id, id))functorBlock {
    id accumulator = value;
    for (id item in self) {
        accumulator = functorBlock(accumulator, item);
    }
    return accumulator;
}

- (id)head {
    if ([self count] == 0) {
        [NSException raise:@"ArrayBoundsException" format:@"Expected array with at least one element, but array was empty."];
    }
    return [self objectAtIndex:0];
}

- (Option *)headOption {
    return ([self count] > 0) ? [Some some:[self head]] : [None none];
}

- (NSArray *)join:(NSArray *)toJoin {
    return [[NSArray arrayWithObjects:self, toJoin, nil] flatMap:^(id item){return item;}];
}

- (id)map:(id (^)(id))funcBlock {
    return [[Enumerations with:self.objectEnumerator] map:funcBlock];
}

- (id)reduce:(id (^)(id, id))functorBlock {
    return [[self tail] fold:[self head] with:functorBlock];
}

- (NSArray *)tail {
    return [self takeRight:[self count] - 1];
}

- (NSArray *)take:(int)n {
    return [self subarrayWithRange:NSMakeRange(0, n)];
}

- (NSArray *)takeWhile:(BOOL (^)(id))funcBlock {
    NSMutableArray *collectedArray = [[[NSMutableArray alloc] init] autorelease];
    for (id item in self) {
        if (funcBlock(item)) {
            [collectedArray addObject:item];
        } else {
            break;
        }
    }
    return [[[NSArray alloc] initWithArray:collectedArray] autorelease];    
}

- (NSArray *)takeRight:(int)n {
    return [self subarrayWithRange:NSMakeRange([self count] - n, n)];
}

- (NSSet *)asSet {
    return [NSSet setWithArray:self];
}

@end
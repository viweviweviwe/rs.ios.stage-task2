#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger result = 0;
    NSInteger intNumber = [number integerValue];
    for (int i = (int)array.count -1; i >= 1; i--){
        for (int j = i; j >= 1; j--) {
                if ([array[i] integerValue] - [array[j-1] integerValue] == intNumber) {
                    result++;
            }
        }
    }
    return result;
}

@end

#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if (array.count == 0 || array == nil || ![array.firstObject isKindOfClass:NSArray.class]) {
        return @[];
    }
    
    NSMutableArray *stringArray = [NSMutableArray array];
    NSMutableArray *numbersArray = [NSMutableArray array];
    
    for (NSArray *currentArray in array) {
        for (id curElement in currentArray) {
            if ([curElement isKindOfClass:NSString.class]) {
                [stringArray addObject:curElement];
            } else {
                [numbersArray addObject:curElement];
            }
        }
    }
    
    if (stringArray.count == 0) {
        NSSortDescriptor *sortDescNumbers = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        [numbersArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescNumbers]];
        return numbersArray;
    }
    else if (numbersArray.count == 0) {
        NSSortDescriptor *sortDescString = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
        [stringArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescString]];
        return stringArray;
    }
    
    NSSortDescriptor *sortDescNumbers = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [numbersArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescNumbers]];
    
    NSSortDescriptor *sortDescString = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)];
    [stringArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescString]];
    
    return [NSArray arrayWithObjects:numbersArray, stringArray, nil];
}

@end

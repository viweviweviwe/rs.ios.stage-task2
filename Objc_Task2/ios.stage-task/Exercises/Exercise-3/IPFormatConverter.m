#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray.count == 0 || numbersArray == nil) {
        return @"";
    }
    NSMutableString *result = [[NSMutableString alloc] init];
    
    for (int i = 0; i < 4; i++) {
        NSInteger currentElement = 0;
        if (i < numbersArray.count) {
            currentElement = [numbersArray[i] intValue];
        }
        if (currentElement < 0){
            return @"Negative numbers are not valid for input.";
        }
        if (currentElement > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        [result appendFormat:@"%lu.", currentElement];
    }
    
    
    return [result substringToIndex:result.length - 1];
}

@end

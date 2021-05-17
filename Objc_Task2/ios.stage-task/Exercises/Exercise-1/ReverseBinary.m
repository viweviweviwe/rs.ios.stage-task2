#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 count = sizeof(n) * 8;
    UInt8 result = 0;
    while (n) {
        result <<= 1;
        result = result|(n & 1);
        n >>= 1;
        count--;
    }
    result <<= count;

    return result;
}

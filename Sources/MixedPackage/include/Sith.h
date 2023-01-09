// Sith.h
//
// Because this header is located in the `include` directory, any type
// defined is exposed publically outside of the target.

#import <Foundation/Foundation.h>

// Import superclass as it cannot be forward declared.
#import "ForceSensitiveBeing.h"

// Forward declare any types defined in Swift.
@class Jedi;

NS_ASSUME_NONNULL_BEGIN

@interface Sith : ForceSensitiveBeing

@property (copy, readonly, nonnull) NSString *name;

- (nullable instancetype)initWithName:(NSString *)name;

// Returns `YES` if this Sith wins against the given Jedi; otherwise, `NO`.
- (BOOL)duelWithJedi:(Jedi *)jedi;

// Access target's resource bundle.
- (NSString *)readTheJediArchives;

@end

NS_ASSUME_NONNULL_END

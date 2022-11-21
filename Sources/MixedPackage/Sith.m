// Sith.m

#import <Foundation/Foundation.h>

#import "Sith.h"

// Import an internal Objective-C header. This demonstrates that the Objective-C
// half of a mixed target can have its own internal types.
#import "SithRegistry.h"

// Import the public C header that we use to log messages to the console.
#import "droid_debug.h"

// Import the Objective-C compatible Swift API exposed by the Swift half of
// the target. This will expose the `Jedi` type.
#import "MixedPackage-Swift.h"

@implementation Sith

- (nullable instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        // `SithRegistry` is an internal type within the Objective-C half of
        // the target.
        if ([SithRegistry registry].activeSithCount == 2) {
            DROID_DEBUG(@"Sorry, there can only be two Sith at one time.".UTF8String);
            return nil;
        }
        _name = name;
    }
    return self;
}

// Note that the `Jedi` is declared by the Swift half of the target.
- (BOOL)duelWithJedi:(Jedi *)jedi {
    // Sith only lose to Master Yoda.
    if ([jedi.name isEqualToString:@"Yoda"]) {
        DROID_DEBUG(
            [NSString stringWithFormat:@"Sith Lord %@ defeated by Master Jedi %@", self.name, jedi.name].UTF8String);
        return NO;
    } else {
        DROID_DEBUG(
            [NSString stringWithFormat:@"Sith Lord %@ defeated Master Jedi %@", self.name, jedi.name].UTF8String);
        return YES;
    }
}

- (NSString *)readTheJediArchives {
    NSBundle *moduleBundle = SWIFTPM_MODULE_BUNDLE;
    NSString *path = [moduleBundle pathForResource:@"hello_there" ofType:@"txt"];
    return [[NSString alloc] initWithContentsOfFile:path
                                           encoding:NSUTF8StringEncoding
                                              error:nil];
}

@end

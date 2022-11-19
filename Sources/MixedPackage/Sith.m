// Sith.m

#import <Foundation/Foundation.h>

#import "Sith.h"

// Import an internal Objective-C header. This demonstrates that the Objective-C
// half of a mixed target can have its own internal types.
#import "SithRegistry.h"

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
            NSLog(@"Sorry, there can only be two Sith at one time.");
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
        NSLog(@"Sith Lord %@ defeated by Master Jedi %@", self.name, jedi.name);
        return NO;
    } else {
        NSLog(@"Sith Lord %@ defeated Master Jedi %@", self.name, jedi.name);
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

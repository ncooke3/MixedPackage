// SithTests.m

#import <XCTest/XCTest.h>

// Import the Mixed Package module. This exposes the public Objective-C and
// Swift types defined in the Mixed Package target.
//
// One downside is that this doesn't offer a way to expose internal Objective-C
// types.
@import MixedPackage;

@interface SithTests : XCTestCase
@end

@implementation SithTests

// Test that public Objective-C and Swift types are accessible.
- (void)testSithAndJedi {
    // Native Objective-C type
    Sith *sithLord = [[Sith alloc] initWithName:@"Sidious"];
    XCTAssertEqual(sithLord.name, @"Sidious");

    // Native Swift type
    Jedi *jediMaster = [[Jedi alloc] initWithName:@"Yoda"];
    XCTAssertEqual(jediMaster.name, @"Yoda");

    // Yoda always wins.
    XCTAssertFalse([sithLord duelWithJedi:jediMaster]);
}

// Test that the target's resources were bundled correctly.
-  (void)testReadAncientSithTexts {
    Sith *sithLord = [[Sith alloc] initWithName:@"Dooku"];
    XCTAssertEqualObjects([sithLord readTheJediArchives], @"May the force be with you!\n");
}

@end

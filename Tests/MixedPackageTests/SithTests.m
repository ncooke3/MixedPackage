// SithTests.m

#import <XCTest/XCTest.h>

// Import the Mixed Package module. This exposes the public Objective-C and
// Swift types defined in the Mixed Package target.
//
// One downside is that this doesn't offer a way to expose internal Objective-C
// types.
@import MixedPackage;

// This import is made possible by the header search path in this test
// target's declaration in the `Package.swift`. This header is not a public
// header exposed by the `MixedPackage` module.
#import "Sources/MixedPackage/SithRegistry.h"

// Import test utilities defined in Swift.
#import "MixedPackageTests-Swift.h"

// Import test utilities defined in Objective-C.
#import "ObjcTestConstants.h"

@interface SithTests : XCTestCase
@end

@implementation SithTests

// Test that public Objective-C and Swift types are accessible.
- (void)testSithAndJedi {
    // Native Objective-C type
    Sith *sithLord = [[Sith alloc] initWithName:TestConstants.sidious];
    XCTAssertEqualObjects(sithLord.name, @"Sidious");

    // Native Swift type
    Jedi *jediMaster = [[Jedi alloc] initWithName:TestConstants.yoda];
    XCTAssertEqualObjects(jediMaster.name, @"Yoda");

    // Yoda always wins.
    XCTAssertFalse([sithLord duelWithJedi:jediMaster]);
}

// Test that the target's resources were bundled correctly.
-  (void)testReadAncientSithTexts {
    Sith *sithLord = [[Sith alloc] initWithName:@"Dooku"];
    XCTAssertEqualObjects([sithLord readTheJediArchives],
                          [ObjcTestConstants mayTheForceBeWithYouMessage]);
}

// This test's purpose is to demonstrate that internal Objective-C types can
// be tested.
- (void)testTypeFromInternalHeader {
    XCTAssertEqual(SithRegistry.registry.activeSithCount, 0);
}

@end

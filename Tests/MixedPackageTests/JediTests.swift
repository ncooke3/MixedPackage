// JediTests.swift

import XCTest

// Import the Mixed Package module. This exposes the public Objective-C and
// Swift types defined in the Mixed Package target.
//
// The `@testable` attribute is used to import internal Swift types of the target.
//
// One downside is that this doesn't offer a way to expose internal Objective-C
// types.
@testable import MixedPackage

final class JediTests: XCTestCase {
    // Test that public Objective-C and Swift types are accessible.
    func testJedi() throws {
        // Native Swift type
        let jediMaster = Jedi(name: "Yoda")
        XCTAssertEqual(jediMaster.name, "Yoda")

        let sithLord = try XCTUnwrap(Sith(name: "Sidious"))
        XCTAssertEqual(sithLord.name, "Sidious")

        // Win, Yoda does.
        XCTAssertTrue(jediMaster.duel(sith: sithLord))
    }

    // Test that internal Swift types are testable.
    func testLightsaber() throws {
        // Note that `Lightsaber` is an internal Swift type. It is exposed by
        // the `@testable` attribute on the import statement.
        let lightsaber = Lightsaber(color: (0 , 255, 0))
        XCTAssertNotNil(lightsaber)
    }

    // Test that the target's resources were bundled correctly.
    func testReadAncientJediTexts() throws {
        let jediMaster = Jedi(name: "Luke")
        let contents = try jediMaster.readAncientJediTexts()
        XCTAssertEqual(contents, "May the force be with you!\n")
    }
}

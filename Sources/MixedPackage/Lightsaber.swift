// Lightsaber.swift

import Foundation

// Note that this type is not public or Objective-C compatible. However, it
// can still tested by importing MixedPackage with the @testable` attribute.
// See `Jedi.Tests` for example test.
struct Lightsaber {
    let color: (red: UInt8, green: UInt8, blue: UInt8)
}

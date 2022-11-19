// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MixedPackage",
    products: [
        .library(
            name: "MixedPackage",
            targets: ["MixedPackage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MixedPackage",
            dependencies: [],
            resources: [
                .process("hello_there.txt")
            ]
        ),
        .testTarget(
            name: "MixedPackageTests",
            dependencies: ["MixedPackage"]
        )
    ]
)


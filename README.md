# MixedPackage

This package provides an example of a Swift Package Manager package with mixed
language sources.

Building or testing this package is not currently supported in Xcode or with
an official release of Swift Package Manager. Instead, checkout 
https://github.com/apple/swift-package-manager/pull/5919 and follow the
instructions [here][apple/swift-package-manager/CONTRIBUTING.md]
to get the local version of SPM building. Then, select the `swift-test` scheme,
and edit it to add the `--package-path /path/to/MixedPackage` argument. This will
set `MixedPackage` as the package to build and test.

From there, the package should build successfully and all tests should pass. Please
open an issue if you run into any trouble.

<!-- Links -->
[apple/swift-package-manager/CONTRIBUTING.md]: https://github.com/apple/swift-package-manager/blob/main/CONTRIBUTING.md#using-xcode-easiest

// MixedPackage.h
//
// Umbrella header for surfacing public Objective-C API. If this header didn't
// exist, Swift Package Manager would treat the `include` directory as an
// umbrella directory.

#import "Sith.h"

// We have to include the C header in the umbrella header if order to expose
// it to the Swift half of the module. In the case of this demo, we will use it
// in the Swift half of the module.
#import "droid_debug.h"

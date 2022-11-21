// droid_debug.c
//
// This file demonstrates that a mixed language target can include C code.

#include "droid_debug.h"

#include <stdio.h>

void DROID_DEBUG(const char * message) {
    printf("%s\n", message);
}

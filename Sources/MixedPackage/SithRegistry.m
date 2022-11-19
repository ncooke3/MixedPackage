// SithRegistry.m

#import <Foundation/Foundation.h>

#import "SithRegistry.h"

@implementation SithRegistry

+ (SithRegistry *)registry {
    static SithRegistry *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[SithRegistry alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _activeSithCount = 0;
  }
  return self;
}

@end

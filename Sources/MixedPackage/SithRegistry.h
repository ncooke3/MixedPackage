// SithRegistry.h
//
// Because this header is not within the `include` directory. Its types are
// internal to the Objective-C half of the target.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SithRegistry : NSObject

+ (SithRegistry *)registry;

@property (readonly) NSUInteger activeSithCount;

@end

NS_ASSUME_NONNULL_END

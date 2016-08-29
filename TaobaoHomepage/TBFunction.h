//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface TBFunction : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;


+ (instancetype)functionWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end

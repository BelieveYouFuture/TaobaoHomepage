//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import "TBFunction.h"

@implementation TBFunction

+ (instancetype)functionWithDict:(NSDictionary *)dict
{

    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{

    if (self = [super init]) {
        
        //KVC 
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end

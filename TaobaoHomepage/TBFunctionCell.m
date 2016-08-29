//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import "TBFunctionCell.h"
#import "TBFunction.h"

@interface TBFunctionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation TBFunctionCell


- (void)setFunction:(TBFunction *)function
{

    _function = function;
    
    self.imageView.image = [UIImage imageNamed:function.icon];

    self.nameLabel.text = function.name;
}


@end

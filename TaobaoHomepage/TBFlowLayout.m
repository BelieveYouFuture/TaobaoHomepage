//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import "TBFlowLayout.h"

@implementation TBFlowLayout

- (void)prepareLayout
{

    [super prepareLayout];
    
    CGFloat itemW = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right  - 3 * self.minimumInteritemSpacing) / 4;
    
    self.itemSize = CGSizeMake(itemW, itemW);

}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{

    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *att in arr) {
        
        if (att.indexPath.section == 1) {
            
            CGRect f = att.frame;
            
            f.size.width = self.collectionView.frame.size.width;
            
            att.frame = f;
        }
    }
    
    return arr;
    

}

@end

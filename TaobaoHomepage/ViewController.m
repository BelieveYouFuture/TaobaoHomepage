//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import "ViewController.h"
#import "TBFunction.h"
#import "TBFunctionCell.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *functions;

@property (nonatomic, strong) NSIndexPath *sourceIndexPath;

@property (nonatomic, strong) NSIndexPath *destinationIndexPath;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //注册中间的cell
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:249/255.0 green:244/255.0 blue:253/255.0 alpha:1.0];
    
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return self.functions.count ;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1) {
        
        return 1;
    }else{
        
        return [self.functions[section] count];
        
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section != 1 ) {
        
       TBFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.function = self.functions[indexPath.section][indexPath.row];
        
        return cell;
        
        
    }else{
        
        UICollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell1.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
        
        return cell1;
        
    }
}


- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        return NO;
    }
    
    return YES;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"111");
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"2222");
    
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
    self.sourceIndexPath = sourceIndexPath;
    self.destinationIndexPath = destinationIndexPath;
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
        
        NSMutableArray *arr = self.functions[sourceIndexPath.section];
        
        //先移除 后添加
        
        TBFunction *f = self.functions[sourceIndexPath.section][sourceIndexPath.row];
        
        [arr removeObject:f];
        
        
        [arr insertObject:f atIndex:destinationIndexPath.row];
    }else{
        
        
        NSMutableArray *arr = self.functions[sourceIndexPath.section];
        
        //先移除 后添加
        
        TBFunction *f = self.functions[sourceIndexPath.section][sourceIndexPath.row];
        
        [arr removeObject:f];
        
        NSMutableArray *desArr = self.functions[destinationIndexPath.section];
        
        if (destinationIndexPath.row >= desArr.count) {
            [desArr addObject:f];
        } else {
            [desArr insertObject:f atIndex:destinationIndexPath.row];
        }
        
        
        
        
    }
    
    //    NSMutableArray *a = self.functions[0];
    //
    //    for (CZFunction  *f in a) {
    //
    //        NSLog(@"%@",f.name);
    //    }
    //
    //    NSMutableArray *a1 = self.functions[2];
    //
    //    for (CZFunction  *f in a1) {
    //
    //        NSLog(@"%@",f.name);
    //    }
}





//懒加载 获取数据
- (NSArray *)functions
{
    
    if (_functions == nil) {
        
        NSMutableArray *temp1 = [NSMutableArray array];
        NSMutableArray *temp2 = [NSMutableArray array];
        NSMutableArray *temp3 = [NSMutableArray array];
        
        
        //加载plist文件 获取数据
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"homeAllFunctions.plist" ofType:nil];
        
        NSArray *temp = [NSArray arrayWithContentsOfFile:path];
        
        //进行分组
        
        for (int i = 0; i < temp.count; i++) {
            
            NSDictionary *dict = temp[i];
            TBFunction *function = [TBFunction functionWithDict:dict];
            
            if (i < 12) {
                [temp1 addObject:function];
            }else{
                
                [temp3 addObject:function];
            }
        }
        
        NSArray *a = @[temp1,temp2,temp3];
        
        _functions = a;
        
    }
    
    return _functions;
}

@end
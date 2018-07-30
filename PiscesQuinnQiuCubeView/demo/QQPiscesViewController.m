//
//  QQPiscesViewController.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesViewController.h"
#import "QQPiscesCubeCollectionView.h"
#import "QQPiscesPlayerCollectionViewCell.h"

@interface QQPiscesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    QQPiscesCubeCollectionView *_cubeView;
    UICollectionViewScrollDirection direction;
    NSMutableArray *datas;
}

@end

@implementation QQPiscesViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    NSLog(@"_______ %s ________-", __FUNCTION__);
    // Do any additional setup after loading the view.
    direction = UICollectionViewScrollDirectionHorizontal;
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = direction;
    
    //only
    _cubeView = [[QQPiscesCubeCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    // Register cell classes
    [_cubeView registerClass:[QQPiscesPlayerCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    _cubeView.backgroundColor = [UIColor blackColor];
    _cubeView.delegate = self;
    _cubeView.dataSource = self;
    [_cubeView setPagingEnabled:YES];
    [self.view addSubview:_cubeView];
    
    datas = [NSMutableArray arrayWithArray:@[@"https://xxx.mp4",
                                             @"https://xxx.mp4",
                                             @"https://xxx.mp4",
                                             @"https://xxx.mp4"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QQPiscesPlayerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor whiteColor];
    [cell configureWithURL:datas[indexPath.row]];
    
    return cell;
}

//must do 
#pragma mark -  UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    QQPiscesCubeCollectionView *view = _cubeView;
    [view animateVisibleCells];
    
    for (QQPiscesPlayerCollectionViewCell *cell in _cubeView.visibleCells) {
        [cell.playerView pause];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    QQPiscesPlayerCollectionViewCell *cell = _cubeView.visibleCells.firstObject;
    [cell.playerView play];
}

@end

//
//  QQPiscesCubeCollectionView.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesCubeCollectionView.h"
#import "QQPiscesCubeCollectionViewCell.h"
#import "QQPiscesCubeViewFunction.h"
#import "UIView+QQPiscesAdjustAnchorPoint.h"

@interface QQPiscesCubeCollectionView() {
    QQPiscesCubeViewFunction *_piscesCubeViewFunction;
}

@end

@implementation QQPiscesCubeCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        _piscesCubeViewFunction = [[QQPiscesCubeViewFunction alloc] init];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}


- (void) animateVisibleCells {
    for (QQPiscesCubeCollectionViewCell *cell in self.visibleCells) {
        [self animateCell:cell];
    }
}

- (void) animateCell: (QQPiscesCubeCollectionViewCell *)cell {
    CGRect convertedFrame = [self convertRect:cell.frame toView:self.superview];
    CGFloat ratio = [_piscesCubeViewFunction distanceRatioWithParentFrame:self.frame cellFrame:convertedFrame];
    CGFloat easingRatio = [_piscesCubeViewFunction valueWithRatio:ratio];
    
    //Configure cell appearance properties
    cell.shadowView.alpha = [_piscesCubeViewFunction shadowAlphaWithDistanceRatio:easingRatio];
    
    CGFloat alpha = [_piscesCubeViewFunction alphaWithDistanceRatio:easingRatio];
    if (alpha) {
        cell.alpha = alpha;
    }
    
    CGFloat cornerRadius = [_piscesCubeViewFunction cornerRadiusWithDistanceRatio:easingRatio];
    if (cornerRadius) {
        cell.layer.cornerRadius = cornerRadius;
    }
    
    //Configure transform of CALayer
    //Needs set anchor point before setting transform
    [cell adjustAnchorPoint:[_piscesCubeViewFunction anchorPointWithDistanceRatio:easingRatio]];
    CATransform3D transform = [_piscesCubeViewFunction transformWithParentFrame:self.frame cellFrame:convertedFrame];
    cell.layer.transform = transform;
    
}

@end

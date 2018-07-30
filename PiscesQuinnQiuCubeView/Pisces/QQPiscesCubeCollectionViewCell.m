//
//  QQPiscesCubeCollectionViewCell.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesCubeCollectionViewCell.h"
#import "UIView+QQPiscesAdjustAnchorPoint.h"

@implementation QQPiscesCubeCollectionViewCell

//override open func prepareForReuse
- (void) prepareForReuse {
    [super prepareForReuse];
    
    //Reset anchorPoint
    [self adjustAnchorPoint:CGPointMake(0.5, 0.5)];
    //Reset CATransform3D
    self.layer.transform = CATransform3DIdentity;
}

- (UIView *) shadowView {
    return nil;
}

@end

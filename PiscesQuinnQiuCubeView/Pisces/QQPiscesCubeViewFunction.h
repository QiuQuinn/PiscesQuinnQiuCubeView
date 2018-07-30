//
//  QQPiscesCubeViewFunction.h
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QQPiscesCubeViewFunction : NSObject

- (CGFloat) valueWithRatio: (CGFloat)ratio;

- (CGFloat) shadowAlphaWithDistanceRatio: (CGFloat)ratio;

- (CGFloat) alphaWithDistanceRatio: (CGFloat)ratio;

- (CGFloat) cornerRadiusWithDistanceRatio: (CGFloat)ratio;

- (CGFloat) distanceRatioWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame;

- (CATransform3D) transformWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame;

- (CGPoint) anchorPointWithDistanceRatio: (CGFloat)ratio;

@end

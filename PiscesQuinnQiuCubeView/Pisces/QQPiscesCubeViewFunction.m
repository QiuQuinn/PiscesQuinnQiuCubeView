//
//  QQPiscesCubeViewFunction.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesCubeViewFunction.h"

typedef NS_ENUM(NSInteger, QQPiscesCubeViewShadowEffect) {
    QQPiscesCubeViewShadowEffect_fadeIn,
    QQPiscesCubeViewShadowEffect_nextFadeIn,
    QQPiscesCubeViewShadowEffect_previousFadeIn,
    QQPiscesCubeViewShadowEffect_fadeOut,
    QQPiscesCubeViewShadowEffect_none
};

@interface QQPiscesCubeViewFunction() {
    CGFloat _cubeDegree;
    CGFloat _alpha;
    CGFloat _cornerRadius;
    
    UIColor *_startBackgroundColor;
    UIColor *_endBackgroundColor;
    
    CGFloat _maxShadowAlpha;
    CGFloat _minShadowAlpha;
    
    QQPiscesCubeViewShadowEffect _shadowEffect;
}

@end

@implementation QQPiscesCubeViewFunction

- (instancetype)init {
    self = [super init];
    if (self) {
        _shadowEffect = QQPiscesCubeViewShadowEffect_fadeIn;
        _maxShadowAlpha = 1.0f;
        _minShadowAlpha = 0.0f;
        _cubeDegree = 90;
    }
    return self;
}

- (CGFloat)easingParameterT: (CGFloat)t B: (CGFloat)b C: (CGFloat)c D: (CGFloat)d {
    return c * t / d + b;
}

- (CGFloat) valueWithRatio: (CGFloat)ratio {
    BOOL isNegative = ratio < 0;
    CGFloat result = [self easingParameterT:isNegative ? -ratio : ratio B:0 C:1 D:1];
    return isNegative ? -result : result;
}

- (CATransform3D) transform3DIdentity {
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 = 1 / 1000.f;
    return identity;
}

- (CGFloat) shadowAlphaWithDistanceRatio: (CGFloat)ratio {
    switch (_shadowEffect) {
        case QQPiscesCubeViewShadowEffect_fadeIn:
            return _minShadowAlpha + fabs(ratio) * _maxShadowAlpha;
            break;
        case QQPiscesCubeViewShadowEffect_nextFadeIn:
            return ratio > 0 ? ratio * _maxShadowAlpha : 0;
            break;
        case QQPiscesCubeViewShadowEffect_previousFadeIn:
            return ratio < 0 ? -ratio *_maxShadowAlpha : 0;
            break;
        case QQPiscesCubeViewShadowEffect_fadeOut:
            return (1 - fabs(ratio)) * _maxShadowAlpha + _minShadowAlpha;
            break;
        case QQPiscesCubeViewShadowEffect_none:
            return .0f;
            break;
        default:
            break;
    }
    
    return .0f;
}

- (CGFloat) alphaWithDistanceRatio: (CGFloat)ratio {
    CGFloat alpha = _alpha;
    return (alpha - 1) * fabs(ratio) + 1;
}

- (CGFloat) cornerRadiusWithDistanceRatio: (CGFloat)ratio {
    CGFloat cornerRadius = _cornerRadius;
    return cornerRadius * fabs(ratio);
}

- (CATransform3D) transformWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame {
    CGFloat _ratio = [self distanceRatioWithParentFrame:parentFrame cellFrame:cellFrame];
    CGFloat ratio = _ratio < 0 ? MAX(-1, _ratio) : MIN(1, _ratio);
    CGFloat easingRatio = [self valueWithRatio:ratio];
    CGFloat toDegree = MAX(0, MIN(90, _cubeDegree));
    CGFloat degree = easingRatio * -toDegree;
    return CATransform3DRotate([self transform3DIdentity], degree * M_PI / 180, 0, 1, 0);
}

- (CGFloat) distanceFromCenterWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame {
    return CGRectGetMidX(cellFrame) - CGRectGetMidX(parentFrame);
}

- (CGFloat) distanceRatioWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame {
    CGFloat distance = [self distanceFromCenterWithParentFrame:parentFrame cellFrame:cellFrame];
    return distance / (CGRectGetWidth(parentFrame) / 2 + CGRectGetWidth(cellFrame) / 2);
}

- (CGFloat) visibleMaxDistanceWithParentFrame: (CGRect)parentFrame cellFrame: (CGRect)cellFrame {
    return CGRectGetMidX(parentFrame) + CGRectGetWidth(cellFrame) / 2;
}

- (CGPoint) anchorPointWithDistanceRatio: (CGFloat)ratio {
    if (ratio > 0) {
        return CGPointMake(0, 0.5);
    } else if (ratio < 0) {
        return CGPointMake(1, 0.5);
    }
    return CGPointMake(0.5, 0.5);
}

@end

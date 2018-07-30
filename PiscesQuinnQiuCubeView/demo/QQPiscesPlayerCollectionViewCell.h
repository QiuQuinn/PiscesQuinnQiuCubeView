//
//  QQPiscesPlayerCollectionViewCell.h
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQPiscesCubeCollectionViewCell.h"
#import "QQPiscesPlayerView.h"

@interface QQPiscesPlayerCollectionViewCell : QQPiscesCubeCollectionViewCell

@property (nonatomic, strong) QQPiscesPlayerView *playerView;

- (void) configureWithURL: (NSString *)url;

@end

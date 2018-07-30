//
//  QQPiscesPlayerCollectionViewCell.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesPlayerCollectionViewCell.h"

@interface QQPiscesPlayerCollectionViewCell() {
    UIView *_backgroundView;
}

@end

@implementation QQPiscesPlayerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _playerView = [[QQPiscesPlayerView alloc] initWithFrame:frame];
        [self.contentView addSubview:_playerView];
        
        _backgroundView = [[UIView alloc] initWithFrame:frame];
        [self.contentView addSubview:_backgroundView];
    }
    return self;
}

//Override
- (UIView *)shadowView {
    return _backgroundView;
}

- (void)configureWithURL:(NSString *)url {
    [_playerView setVideoURL:url];
    [_playerView play];
}

@end

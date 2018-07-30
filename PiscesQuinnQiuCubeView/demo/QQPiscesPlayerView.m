//
//  QQPiscesPlayerView.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "QQPiscesPlayerView.h"

@interface QQPiscesPlayerView() {
    AVPlayerLayer *_playerLayer;
}

@end

@implementation QQPiscesPlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) init {
    self = [super init];
    if (self) {
        [self createPlayerLayer];
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return self;
}

- (instancetype) initWithFrame: (CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createPlayerLayer];
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createPlayerLayer];
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return self;
}

- (void) createPlayerLayer {
    if (!_playerLayer) {
        _playerLayer = [[AVPlayerLayer alloc] init];
    }
}

- (void) setVideoURL: (NSString *)url {
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:url]];
    _playerLayer.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
}

- (void) play {
    [_playerLayer.player play];
}

- (void) pause {
    [_playerLayer.player pause];
}

@end

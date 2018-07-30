//
//  QQPiscesPlayerView.h
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QQPiscesPlayerView : UIView

- (void) setVideoURL: (NSString *)url;
- (void) play;
- (void) pause;

@end

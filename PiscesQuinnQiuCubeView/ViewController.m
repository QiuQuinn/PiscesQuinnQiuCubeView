//
//  ViewController.m
//  PiscesQuinnQiuCubeView
//
//  Created by QuinnQiu on 2018/7/27.
//  Copyright © 2018年 QuinnQiu. All rights reserved.
//

#import "ViewController.h"
#import "QQPiscesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    button.center = self.view.center;
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"cube" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickCubeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) clickCubeButton:(UIButton *)sender {
    NSLog(@"________ %s __________", __FUNCTION__);
    QQPiscesViewController *vc = [[QQPiscesViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}


@end

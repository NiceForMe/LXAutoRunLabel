//
//  ViewController.m
//  LXAutoRunLabel
//
//  Created by mac on 2019/6/1.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "LXAutoRunLabel.h"

@interface ViewController ()
@property (nonatomic,strong) LXAutoRunLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LXAutoRunLabel *label = [[LXAutoRunLabel alloc]initWithFrame:CGRectMake(50, 100, 300, 50) text:@"这是一个滚动label这是一个滚动label这是一个滚动label这是一个滚动label这是一个滚动labelaaa" duration:3.0];
    label.backgroundColor = [UIColor lightGrayColor];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5.0;
    self.label = label;
    [self.view addSubview:label];
    NSArray *btnArray = @[@"startAnimation",@"stopAnimation"];
    NSInteger i = 0;
    UIButton *lastBtn;
    for (NSString *str in btnArray) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (lastBtn) {
            btn.frame = CGRectMake(50, CGRectGetMaxY(lastBtn.frame) + 20, 200, 50);
        }else{
            btn.frame = CGRectMake(50, CGRectGetMaxY(label.frame) + 20, 200, 50);
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(btnActionWithSender:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        i++;
        lastBtn = btn;
    }
}

- (void)btnActionWithSender:(UIButton *)sender
{
    if (sender.tag == 0) {
        [self.label startAnimation];
    }else{
        [self.label stopAnimation];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

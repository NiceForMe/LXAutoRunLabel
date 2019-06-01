//
//  LXAutoRunLabel.m
//  LXTestProject
//
//  Created by HSEDU on 2019/5/7.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "LXAutoRunLabel.h"

@interface LXAutoRunLabel ()<CAAnimationDelegate>
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) CGFloat duration;
@property (nonatomic,strong) UILabel *autoLabel;
@end

@implementation LXAutoRunLabel
- (instancetype)initWithFrame:(CGRect)frame text:(nonnull NSString *)text duration:(CGFloat)duration
{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.frame = frame;
        self.text = text;
        self.duration = duration;
        [self initRunLabel];
    }
    return self;
}

- (void)initRunLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.text = self.text;
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(0, 1000) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName : label.font} context:nil].size;
    label.frame = CGRectMake(0, self.frame.size.height / 2 - size.height / 2, size.width, size.height);
    self.autoLabel = label;
    [self addSubview:label];
}

- (void)startAnimation
{
    [self.autoLabel.layer removeAnimationForKey:@"animationViewPosition"];
    CGSize size = CGSizeMake(self.autoLabel.frame.size.width, self.autoLabel.frame.size.height);
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint fromPoint = CGPointMake(10 + size.width / 2, self.autoLabel.frame.origin.y + size.height / 2);
    CGPoint toPoint = CGPointMake(-((size.width - self.frame.size.width) / 2), self.autoLabel.frame.origin.y + size.height / 2);
    [path moveToPoint:fromPoint];
    [path addLineToPoint:toPoint];
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.delegate = self;
    moveAnimation.path = path.CGPath;
    moveAnimation.removedOnCompletion = YES;
    moveAnimation.duration = self.duration;
    [self.autoLabel.layer addAnimation:moveAnimation forKey:@"animationViewPosition"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag == YES) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimation];
        });
    }
}

- (void)stopAnimation
{
    [self.autoLabel.layer removeAnimationForKey:@"animationViewPosition"];
}

@end

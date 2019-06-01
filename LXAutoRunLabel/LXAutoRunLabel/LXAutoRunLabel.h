//
//  LXAutoRunLabel.h
//  LXTestProject
//
//  Created by HSEDU on 2019/5/7.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXAutoRunLabel : UIView
- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text duration:(CGFloat)duration;
- (void)startAnimation;
- (void)stopAnimation;
@end

NS_ASSUME_NONNULL_END

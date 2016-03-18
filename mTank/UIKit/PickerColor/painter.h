//
//  painter.h
//  circle Control
//
//  Created by 阿城 on 15/10/14.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol painterDelegate <NSObject>

-(void)changeColor:(UIColor *)color;

@end
@interface painter : UIView

{
    id <painterDelegate> delegate;
    
}
@property (nonatomic ,copy) void (^colBlock) (UIColor *);
@property (nonatomic, retain) id <painterDelegate> delegate;
@end

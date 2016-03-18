//
//  circleVIew.h
//  circle Control
//
//  Created by 阿城 on 15/10/11.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCenter CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5)
#define kRadius (self.bounds.size.width * 0.5 - 20)

@interface circleVIew : UIView

@property (nonatomic ,copy) void (^colorBlock)(UIColor *);

@end

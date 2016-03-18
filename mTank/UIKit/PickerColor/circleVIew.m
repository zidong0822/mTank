//
//  circleVIew.m
//  circle Control
//
//  Created by 阿城 on 15/10/11.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "circleVIew.h"


@interface circleVIew ()
@property (nonatomic, assign, getter=isOn) BOOL On;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) CGPoint pointCenter;
@property (nonatomic ,assign) CGFloat angle;
@end

@implementation circleVIew

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    CGPoint current = [touches.anyObject locationInView:self];
    CGRect rect = CGRectMake(_pointCenter.x - 20, _pointCenter.y - 20, 40, 40);
    self.On = CGRectContainsPoint(rect, current);
}

- (void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    if (self.isOn) {
        _point = [touches.anyObject locationInView:self];
//        NSLog(@"%@", NSStringFromCGPoint(_point));
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{


    _pointCenter = relative(kCenter, kRadius, 0);
    
    if (!CGPointEqualToPoint(_point, CGPointZero)) {
        _angle = atan2((_point.y - kCenter.y), (_point.x - kCenter.x));
        _pointCenter = relative(kCenter, kRadius * cos(_angle), kRadius * sin(_angle));
//        NSLog(@"%f", _angle * 180 / M_PI);
//        NSLog(@"%@",NSStringFromCGPoint(_pointCenter));
    }

    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:_pointCenter
                                                        radius:10
                                                    startAngle:0
                                                      endAngle:2 * M_PI
                                                     clockwise:1];
    [[UIColor whiteColor]setFill];
    [path fill];
    [path stroke];

    if (self.colorBlock) {
        self.colorBlock([UIColor colorWithHue:(-_angle / M_PI * 0.5 + 0.5) saturation:1 brightness:1 alpha:1]);
    }
    
}

CGPoint relative(CGPoint point, CGFloat x, CGFloat y)
{
    return CGPointMake(point.x + x, point.y + y);
}

@end

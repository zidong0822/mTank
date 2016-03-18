//
//  painter.m
//  circle Control
//
//  Created by 阿城 on 15/10/14.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "painter.h"
#import "circleVIew.h"


@implementation painter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)didMoveToSuperview{
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:kCenter radius:kRadius startAngle:0 endAngle:2*M_PI clockwise:1];
    shape.path = path.CGPath;
    shape.lineWidth = 20;
    shape.fillColor = [UIColor clearColor].CGColor;
    shape.strokeColor = [UIColor blackColor].CGColor;
    
    UIImageView *img = [UIImageView new];
    img.image = [UIImage imageNamed:@"全色"];
    img.bounds = self.bounds;
    img.center = kCenter;
    [self addSubview:img];
    img.layer.mask = shape;
    
    CALayer *lay = [CALayer layer];
    CGFloat r = self.bounds.size.width * 0.35;
    lay.bounds = CGRectMake(0, 0, 2*r, 2*r);
    lay.position = kCenter;
    lay.cornerRadius = r;
    [self.layer addSublayer:lay];
    
    circleVIew *cir = [circleVIew new];
    cir.bounds = self.bounds;
    cir.center = kCenter;
    [self addSubview:cir];

    cir.colorBlock = ^(UIColor *color){
    lay.backgroundColor = color.CGColor;
  
    if (self.colBlock) {
        self.colBlock(color);
    }
    };
    
}


-(void)drawRect:(CGRect)rect{
    
}

@end

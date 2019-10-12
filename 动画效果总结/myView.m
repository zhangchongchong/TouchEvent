//
//  myView.m
//  动画效果总结
//
//  Created by 张冲 on 2018/4/25.
//  Copyright © 2018年 张冲. All rights reserved.
//

#import "myView.h"

@implementation myView
- (void)drawRect:(CGRect)rect {
    //矩形贝塞尔曲线

    /*
    UIBezierPath* bezierPath_rect = [UIBezierPath bezierPathWithRect:CGRectMake(30, 50, 100, 100)];
    [bezierPath_rect moveToPoint:CGPointMake(60, 60)];
    [bezierPath_rect addLineToPoint:CGPointMake(80, 80)];
    [bezierPath_rect addLineToPoint:CGPointMake(60, 90)];
    //[bezierPath_rect closePath];
    //[bezierPath_rect removeAllPoints];
    bezierPath_rect.lineCapStyle = kCGLineCapButt;  //端点类型
    bezierPath_rect.lineJoinStyle = kCGLineJoinMiter;  //线条连接类型
    bezierPath_rect.miterLimit = 1;
    CGFloat dash[] = {20,1};
    [bezierPath_rect setLineDash:dash count:2 phase:0];
    bezierPath_rect.lineWidth = 10;
    */
    //圆形 椭圆贝塞尔曲线
    /*
    UIBezierPath *bezierPath_oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 50, 150, 100)];
    bezierPath_oval.lineWidth = 10;
    */
    //还有圆角的贝塞尔曲线
    /*
    UIBezierPath *bezierPath_RoundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 200, 100, 100) cornerRadius:20];
    bezierPath_RoundedRect.lineWidth = 10;
    //绘制可选择圆角方位的贝塞尔曲线
    UIBezierPath *bezierPath_RoundedCornerRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 200, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    bezierPath_RoundedCornerRect.lineWidth = 10;

    //绘制圆弧曲线
    UIBezierPath *bezierPath_ArcCenter = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 400) radius:50 startAngle:M_PI / 2 * 3 endAngle:M_PI / 3 clockwise:YES];
    bezierPath_ArcCenter.lineWidth = 10;
*/
    //添加二次 三次贝塞尔曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    [bezierPath moveToPoint:CGPointMake(10, 520)];
    [bezierPath addLineToPoint:CGPointMake(50, 530)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 510) controlPoint:CGPointMake(80, 650)];
    [bezierPath addCurveToPoint:CGPointMake(200, 530) controlPoint1:CGPointMake(130, 600) controlPoint2:CGPointMake(170, 400)];
    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];

    [bezierPath moveToPoint:CGPointMake(20, 520)];
    [bezierPath addLineToPoint:CGPointMake(40, 520)];
    //根据CGPathRef绘制贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 640);
    CGPathAddCurveToPoint(path, NULL, 100, 700, 250, 550, 350, 650);

//    UIBezierPath *bezierPath_CGPath = [UIBezierPath bezierPathWithCGPath:path];
//    bezierPath_CGPath.lineWidth = 4;
//    //选择填充颜色
//    [[UIColor redColor] set];
//    [bezierPath_rect fill];
//    [bezierPath_oval fill];
//    [bezierPath_RoundedRect fill];
//    [bezierPath_RoundedCornerRect fill];
    //[bezierPath_ArcCenter fill];
    //[bezierPath_CGPath fill];

    //选择线条颜色
    [[UIColor blackColor] set];
//    [bezierPath_rect stroke];
//    [bezierPath_oval stroke];
//    [bezierPath_RoundedRect stroke];
//    [bezierPath_RoundedCornerRect stroke];
//    [bezierPath_ArcCenter stroke];
    [bezierPath stroke];
//    [bezierPath_CGPath stroke];
    //
    CALayer* aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 520);
    aniLayer.bounds = CGRectMake(0, 0, 8, 8);
    aniLayer.cornerRadius = 4;
    [self.layer addSublayer:aniLayer];
    //
    CAKeyframeAnimation* keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = NSIntegerMax;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 15;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;
    [aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];



    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer.endPoint = CGPointMake(0.5, 0.5);//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer.colors = [NSArray arrayWithObjects:(id)[UIColor blueColor].CGColor,(id)[UIColor redColor].CGColor,(id)[UIColor greenColor].CGColor, nil];
    layer.locations = @[@0.0f,@0.6f,@1.0f];//渐变颜色的区间分布，locations的数组长度和color一致，这个值一般不用管它，默认是nil，会平均分布
    layer.frame = self.layer.bounds;
    [self.layer insertSublayer:layer atIndex:0];



    
}
//图片抖动
- (void)shakeAnimationForView:(UIView *) view {
    CALayer *viewLayer = view.layer;
    NSLog(@"viewLayer.positoin = %f,%f",viewLayer.position.x,viewLayer.position.y);
    viewLayer.anchorPoint = CGPointMake(0.5, 1.0);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setFromValue:@(M_PI_4)];
    [animation setToValue:@(-M_PI_4)];
    [animation setAutoreverses:YES];
    [animation setDuration:0.5];
    [animation setRepeatCount:10];
    [viewLayer addAnimation:animation forKey:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

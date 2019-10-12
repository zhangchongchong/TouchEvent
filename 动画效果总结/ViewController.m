//
//  ViewController.m
//  动画效果总结
//
//  Created by 张冲 on 2018/2/22.
//  Copyright © 2018年 张冲. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
@interface ViewController ()
@property (nonatomic,strong) UIView *animalView;
@property (nonatomic,strong) UIView *animalView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    myView *view = [[myView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
//
//    _animalView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    _animalView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_animalView];
//
//    _animalView2 = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
//    _animalView2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_animalView2];

    /*
     * uiview 动画
     */
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDelay:1.0];
//    [UIView setAnimationDuration:2.0];
//    [UIView setAnimationRepeatCount:10];
//    [UIView setAnimationRepeatAutoreverses:YES];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//    _animalView.alpha = 0.3;
//    _animalView.frame = CGRectMake(200,100 ,20,20);
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDidStopSelector:@selector(animalStop)];
//    [UIView setAnimationWillStartSelector:@selector(animalStart)];
//    [UIView commitAnimations];
//



    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    /*
    [UIView animateWithDuration:2.0 animations:^{
        //        _animalView2.transform = CGAffineTransformRotate(_animalView2.transform, M_PI);
        //        _animalView2.transform = CGAffineTransformMakeTranslation(-100, 100);
        //        _animalView2.transform = CGAffineTransformScale(<#CGAffineTransform t#>, <#CGFloat sx#>, <#CGFloat sy#>)
//        _animalView2.transform = CGAffineTransformMakeScale(-1.0, -1.0);
        _animalView2.transform = CGAffineTransformMakeRotation(M_PI*-0.9);
    }];
    [UIView animateWithDuration:2.0 animations:^{
        _animalView2.transform = CGAffineTransformMakeRotation(M_PI*-0.7);

    } completion:^(BOOL finished) {
        _animalView2.transform = CGAffineTransformIdentity;
    }];

     */
//    [UIView animateKeyframesWithDuration:2.0 delay:1.0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
//        _animalView2.transform = CGAffineTransformMakeRotation(M_PI*-0.9);
//
//    } completion:^(BOOL finished) {
//
//    }];
//    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
//        _animalView2.center = CGPointMake(_animalView2.center.x +10, _animalView2.center.y);
//    } completion:^(BOOL finished) {
//
//    }];
    [UIView transitionWithView:_animalView2 duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{

    } completion:^(BOOL finished) {

    }];
}
- (void)animalStart{
    NSLog(@"动画开始");
}
- (void)animalStop{
    NSLog(@"动画停止");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

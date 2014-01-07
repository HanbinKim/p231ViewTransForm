//
//  ViewController.m
//  p231ViewTransForm
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgaeView;

@end

@implementation ViewController

- (IBAction)series:(id)sender
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration: 0.2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	self.imgaeView.frame = CGRectMake(0.0f, 0.0f, 160.0f, 200.0f);
	[UIView commitAnimations];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration: 0.2]; // 시간
	self.imgaeView.frame = CGRectMake(100.0f, 0.0f, 160.0f, 200.0f);
	[UIView commitAnimations];
}

- (IBAction)setOriginal:(id)sender
{
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imgaeView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
}

- (IBAction)combination:(id)sender
{
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    CGAffineTransform t = CGAffineTransformConcat(self.imgaeView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imgaeView.transform = t;
    
    [UIView commitAnimations];
    /* 블록방식
    [UIView animateWithDuration:0.7 animations:^{self.imgaeView.transform =t}];
     */
}

- (IBAction)rotate:(id)sender
{
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imgaeView.transform = CGAffineTransformRotate(self.imgaeView.transform, M_PI);
    
    [UIView commitAnimations];
    
    // 블록방식 [UIView animateWithDuration:0.7 animations:^{self.imgaeView.transform = CGAffineTransformRotate(self.imgaeView.transform, M_PI);}];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

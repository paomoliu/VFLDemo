//
//  ViewController.m
//  VFL
//
//  Created by paomoliu on 16/1/17.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button1 = [[UIButton alloc] init];
    //button.frame = CGRectMake(50, 50, 100, 100);
    button1.backgroundColor = [UIColor yellowColor];
    [button1 setTitle:@"ceshi" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    UIButton *view1 = [[UIButton alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    UIButton *view2 = [[UIButton alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"leaves.png"];
    [self.view addSubview:imageView];
    
    UIButton *button2 = [[UIButton alloc] init];
    button2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button2];
    
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    
    //通过宏映射成字典参数
    NSDictionary *views = NSDictionaryOfVariableBindings(button1, view1, view2, imageView, button2);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button1]-|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[view1(view2)]-[view2]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[view1]" options:0 metrics:nil views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[imageView(260)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button2]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==tpadding)-[imageView(400)]->=5-[button2]-(bpadding)-|" options:NSLayoutFormatAlignAllCenterX metrics:@{@"tpadding": @100, @"bpadding": @12} views:views]];
    
    //NSLog(@"view x = %f", button1.frame.origin.x);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  RJProgressHudDemo
//
//  Created by RAHUL KUMAR JAIN on 06/01/18.
//  Copyright © 2018 RAHUL KUMAR JAIN. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) ProgressHudPresenter *hudPresenter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _hudPresenter = [[ProgressHudPresenter alloc] init];
    [_hudPresenter setTitle:@"Yeepieee, Hud dimiss within 30 Sec."];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHude:(UIButton *)sender {
    [_hudPresenter presentHud];
    [self performSelector:@selector(hideHude) withObject:nil afterDelay:30];
}

- (void)hideHude{
    [_hudPresenter hideHud];
}

@end

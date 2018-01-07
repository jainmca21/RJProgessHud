//
//  ProgressHudPresenter.h
//
// ProgressHudPresenter mannage RJProgressHud object (Which showing loading animation). Its showing single object even multiple callback. Object apperance managed by visible count.
//  Created by RAHUL KUMAR JAIN on 06/01/18.
//  Copyright © 2018 RAHUL KUMAR JAIN. All rights reserved.

#import <UIKit/UIKit.h>

@interface ProgressHudPresenter : NSObject

@property(nonatomic, retain) NSString* title;

- (id)initForView:(UIView *)view;

- (void)presentHud;
- (void)presentHud:(UIView *)view;
- (BOOL)isHudPresented;

- (void)hideHud;

@end

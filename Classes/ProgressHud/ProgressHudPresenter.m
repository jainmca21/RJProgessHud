//
//  ProgressHudPresenter.m
//  Created by RAHUL KUMAR JAIN on 06/01/18.
//  Copyright © 2018 RAHUL KUMAR JAIN. All rights reserved.

#import "ProgressHudPresenter.h"
#import "RJProgressHUD.h"

NSInteger visibleCount;

@implementation ProgressHudPresenter {
    RJProgressHUD* progressHud;
}

- (id)init {
    if (self = [super init]) {
        progressHud = [[RJProgressHUD alloc] initWithWindow:([UIApplication sharedApplication].delegate).window];
        progressHud.mode = RJProgressHUDModeIndeterminate;
        progressHud.animationType = RJProgressHUDAnimationZoom;
        visibleCount = 0;
    }
    return self;
}

- (id)initForView:(UIView *)view
{
    if (self = [super init]) {
        progressHud = [[RJProgressHUD alloc] initWithView:view];
        progressHud.mode = RJProgressHUDModeIndeterminate;
        progressHud.animationType = RJProgressHUDAnimationZoom;
        progressHud.labelText = NSLocalizedString(@"Loading", @"Loading"); //Default text
        visibleCount = 0;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    progressHud.labelText = title;
}

- (NSString*)title {
    return progressHud.labelText;
}

- (BOOL)isHudPresented
{
    return visibleCount ? YES: NO;
}

- (void)presentHud {

    visibleCount += 1;

    if (visibleCount > 1)
    {
        return;
    }
    
    [progressHud setTag:1993];
    [([UIApplication sharedApplication].delegate).window addSubview:progressHud];
    [progressHud show:YES];
}

// Manage visbilty of RJProgresshud view object, if visible count is more then 1 then display previous allocated object.

- (void)presentHud:(UIView *)view {
    //DDLogInfo(@"---presentHud:%d", visibleCount);
    
    visibleCount += 1;
    
    if (visibleCount > 1)
    {
        return;
    }

    [progressHud setTag:1993];
    [view addSubview:progressHud];
    [progressHud show:YES];

}

/**
 *  remove RJProgresshud view object when visible count is  0
 */
- (void)hideHud {

    //DDLogInfo(@"---hideHud:%d", visibleCount);

    if (visibleCount) {
        visibleCount -= 1;
    }
    
    if (visibleCount == 0)
    {
        [progressHud removeFromSuperview];
        [progressHud hide:YES];
    }
}

@end

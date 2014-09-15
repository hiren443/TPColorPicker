//
//  AppDelegate.h
//  TPColorPicker
//
//  Created by Hiren J. Bhadreshwara on 12/08/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;
-(void)setRoundedView:(UIButton *)vW;
@end

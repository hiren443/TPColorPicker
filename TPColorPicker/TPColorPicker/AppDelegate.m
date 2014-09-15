//
//  AppDelegate.m
//  TPColorPicker
//
//  Created by Hiren J. Bhadreshwara on 12/08/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewCntrl.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RootViewCntrl *root = [[RootViewCntrl alloc] initWithNibName:@"RootViewCntrl" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:root];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowBlurRadius = 0.0;
    shadow.shadowOffset = CGSizeMake(0.0, 1.0);
    [[UINavigationBar appearance] setTitleTextAttributes: @{
															NSFontAttributeName:[UIFont boldSystemFontOfSize:21],
                                                            NSForegroundColorAttributeName:[UIColor whiteColor],
															NSShadowAttributeName:shadow
															}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:45.0/255.0 green:150.0/255.0 blue:184.0/255.0 alpha:1.0];
        self.window.backgroundColor = [UIColor colorWithRed:159.0/255.0 green:159.0/255.0 blue:159.0/255.0 alpha:1.0];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navi_blue.png"] forBarMetrics:UIBarMetricsDefault];

    self.window.rootViewController = self.navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)setRoundedView:(UIButton *)vW{
    CALayer *image = vW.layer;
	[image setCornerRadius:5];
	[image setBorderWidth:2];
    image.masksToBounds = YES;
    image.borderColor = [UIColor colorWithRed:202.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1].CGColor;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

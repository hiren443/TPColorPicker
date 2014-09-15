//
//  RootViewCntrl.m
//  TPColorPicker
//
//  Created by Hiren J. Bhadreshwara on 12/08/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import "RootViewCntrl.h"
#import "AppDelegate.h"

@interface RootViewCntrl ()

@end

@implementation RootViewCntrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDel setRoundedView:txtNormal];
    [appDel setRoundedView:txtSelected];
    [appDel setRoundedView:boxNormal];
    [appDel setRoundedView:boxSelected];
    self.title = @"Color Picker Demo";
    CALayer *image = normalBox.layer;
	[image setCornerRadius:5];
	[image setBorderWidth:1];
    image.masksToBounds = YES;
    image.borderColor = [UIColor colorWithRed:202.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1].CGColor;

    CALayer *image1 = selectedBox.layer;
	[image1 setCornerRadius:5];
	[image1 setBorderWidth:1];
    image1.masksToBounds = YES;
    image1.borderColor = [UIColor colorWithRed:202.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1].CGColor;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)txtSelectedTap:(id)sender {
    [self createPopOver:txtSelected];
}
- (IBAction)txtnormalTap:(id)sender {
    [self createPopOver:txtNormal];
}
- (IBAction)boxNormal:(id)sender {
    [self createPopOver:boxNormal];
}
- (IBAction)boxSelectedTap:(id)sender {
    [self createPopOver:boxSelected];
}

-(void)createPopOver:(UIButton *)btnType{
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }
    if (popoverController == nil) {
        pickerPopOver = [[PickerViewCntrlr alloc] initWithNibName:@"PickerViewCntrlr" bundle:[NSBundle mainBundle]];
        pickerPopOver.btnType = btnType;
        
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonPressed)];
        [pickerPopOver.navigationItem setRightBarButtonItem:cancelButton animated:NO];
        pickerPopOver.delegate = self;
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:pickerPopOver];
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:navController];
        popover.delegate = self;
        popoverController = popover;
    }
    
    CGRect popoverRect = [self.view convertRect:[btnType frame] fromView:[btnType superview]];
    
    popoverRect.size.width = MIN(popoverRect.size.width, 80) ;
//    popoverRect.size.height = 568
    popoverRect.origin.x  = popoverRect.origin.x+118;
    
    [popoverController
     presentPopoverFromRect:popoverRect
     inView:self.view
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
}

-(void)cancelButtonPressed{
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }
}
-(void)optionSelected:(UIColor *)colorOption view:(UIButton *)btnType{
    if(btnType == txtNormal){
        [normalTxt setTitleColor:colorOption forState:UIControlStateNormal];
    }
    else if(btnType == txtSelected){
        [selectedTxt setTitleColor:colorOption forState:UIControlStateNormal];
    }
    else if(btnType == boxSelected){
        [selectedBox setBackgroundColor:colorOption];
    }
    else if(btnType == boxNormal){
        [normalBox setBackgroundColor:colorOption];
    }
    
    NSString *hexString = [self hexStringFromColor:colorOption];

    NSLog(@"Hex String %@", hexString);
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
        popoverController=nil;
    }
}
- (NSString *)hexStringFromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    NSLog(@"RED %f  GREEN %f  BLUE %f", r*255,g*255,b*255);
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}
@end

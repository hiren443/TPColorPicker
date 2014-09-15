//
//  RootViewCntrl.h
//  TPColorPicker
//
//  Created by Hiren J. Bhadreshwara on 12/08/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewCntrlr.h"

@interface RootViewCntrl : UIViewController<PickerViewDelegate, UIPopoverControllerDelegate>
{
    __weak IBOutlet UIButton *txtNormal;
    __weak IBOutlet UIButton *txtSelected;
    __weak IBOutlet UIButton *boxSelected;
    __weak IBOutlet UIButton *boxNormal;


    __weak IBOutlet UIView *normalBox;
    __weak IBOutlet UIView *selectedBox;
    __weak IBOutlet UIButton *normalTxt;
    __weak IBOutlet UIButton *selectedTxt;
    
    PickerViewCntrlr *pickerPopOver;
    UIPopoverController *popoverController;
}
- (IBAction)txtSelectedTap:(id)sender;
- (IBAction)txtnormalTap:(id)sender;
- (IBAction)boxNormal:(id)sender;
- (IBAction)boxSelectedTap:(id)sender;

@end

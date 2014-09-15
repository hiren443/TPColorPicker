//
//  PickerViewCntrlr.h
//  StremlineMD
//
//  Created by Hiren J. Bhadreshwara on 22/05/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKOColorPickerView.h"

@protocol PickerViewDelegate
-(void) optionSelected:(UIColor *)colorOption view:(UIButton *)btnType;
@end

@interface PickerViewCntrlr : UIViewController
{
    id<PickerViewDelegate> _delegate;

}
@property (nonatomic, retain) id<PickerViewDelegate> delegate;
@property (nonatomic, retain) UIButton *btnType;
-(IBAction)onButtonClick:(id)sender;

@end

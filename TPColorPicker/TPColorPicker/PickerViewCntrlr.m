//
//  PickerViewCntrlr.m
//  StremlineMD
//
//  Created by Hiren J. Bhadreshwara on 22/05/14.
//  Copyright (c) 2014 digicorp. All rights reserved.
//

#import "PickerViewCntrlr.h"
#import "NKOColorPickerView.h"

@interface PickerViewCntrlr ()

@property (nonatomic, weak) IBOutlet NKOColorPickerView *pickerView;
@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation PickerViewCntrlr
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

    if([UIViewController instancesRespondToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
//    self.contentSizeForViewInPopover = CGSizeMake(320.0, 568);
//    self.preferredContentSize = CGSizeMake(320.0, 568);
    
    __weak PickerViewCntrlr *weakSelf = self;
    
    [self.pickerView setDidChangeColorBlock:^(UIColor *color){
        [weakSelf _customizeButton];
    }];
    
    [self.pickerView setTintColor:[UIColor darkGrayColor]];
    [self _customizeButton];
}
#pragma mark - Private methods
- (void)_customizeButton
{
    self.button.layer.cornerRadius = 6;
    self.button.backgroundColor = self.pickerView.color;
}
-(IBAction)onButtonClick:(id)sender{
    if (_delegate != nil){
        UIColor *color = self.pickerView.color;
        [_delegate optionSelected:color view:_btnType];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

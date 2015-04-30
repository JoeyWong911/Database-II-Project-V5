//
//  PlayerViewController.h
//  Database II Project V5
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataClass.h"
#import "Master.h"
#import "PlayerModel.h"
#import "PlayerDetailsViewController.h"


@interface PlayerViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *playerFirstName;

@property (weak, nonatomic) IBOutlet UITextField *playerLastName;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
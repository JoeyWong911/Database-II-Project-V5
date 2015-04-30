//
//  LoginViewController.h
//  Database II Project V3
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userID;

@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)signInClicked:(id)sender;

- (IBAction)backgroundTap:(id)sender;

@end

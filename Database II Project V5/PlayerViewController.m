//
//  PlayerViewController.m
//  Database II Project V5
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    
    NSArray *_pickerData;

    
}
//{
//    PlayerModel *_playerModel;
//    NSArray *_feedItems;
//}

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataClass *obj=[DataClass getInstance];
    
    obj.searchField = @"master";
    
    // Initialize Data
    _pickerData = @[@"Select search field",
                    @"Batting",
                    @"Pitching",
                    @"Fielding",
                    @"Salaries",
                    @"College"];
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    DataClass *obj=[DataClass getInstance];
    
    if (textField == self.playerLastName) {
        [textField resignFirstResponder];
    } else if (textField == self.playerFirstName) {
        [self.playerLastName becomeFirstResponder];
    }
    
    NSLog(@"You entered %@ %@",self.playerFirstName.text, self.playerLastName.text);
    
    obj.playerFirstName = _playerFirstName.text;
    obj.playerLastName = _playerLastName.text;
    
    
    return YES;
    
}



// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    DataClass *obj=[DataClass getInstance];
    
    switch (row) {
        case 1:
            obj.searchField = @"batting";
            break;
        case 2:
            obj.searchField = @"pitching";
            break;
        case 3:
            obj.searchField = @"fielding";
            break;
        case 4:
            obj.searchField = @"salaries";
            break;
        case 5:
            obj.searchField = @"college";
            break;
        default:
            obj.searchField = @"master";
            break;
    }
    
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


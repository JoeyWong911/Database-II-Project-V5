//
//  PlayerDetailsViewController.m
//  Database II Project V5
//
//  Created by Joey Wong on 4/30/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "PlayerDetailsViewController.h"

@interface PlayerDetailsViewController () <UITextFieldDelegate>
{
    PlayerModel *_playerModel;
    NSArray *_feedItems;
}

@end

@implementation PlayerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _playerModel = [[PlayerModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _playerModel.delegate = self;
    
    // Call the download items method of the home model object
    [_playerModel downloadItems];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}


#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //NSLog(@"Feed items number: %li", _feedItems.count);
    
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataClass *obj=[DataClass getInstance];
    
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Master *item = _feedItems[indexPath.row];
        
    if ([obj.searchField  isEqual: @"master"]) {
        
        NSString *playerDetails = [[NSString alloc] initWithFormat:@"First Name: %@\nLast Name: %@\nGiven Name: %@\n\nWeight: %@\nHeight: %@\nBats: %@\nThrows: %@\n\nBirthday (DD/MM/YYYY):\n%@/%@/%@\nBirth Place:\n%@, %@, %@",item.nameFirst, item.nameLast, item.nameGiven, item.weight, item.height, item.bats, item.throws, item.birthDay, item.birthMonth, item.birthYear, item.birthCity, item.birthState, item.birthCountry];
        
        myCell.textLabel.text = playerDetails;
        myCell.textLabel.numberOfLines = 0;
        myCell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    } else if ([obj.searchField  isEqual: @"batting"]) {
        
    } else if ([obj.searchField  isEqual: @"pitching"]) {
        
    } else if ([obj.searchField  isEqual: @"fielfing"]) {
        
    } else if ([obj.searchField  isEqual: @"salaries"]) {
        
    } else if ([obj.searchField  isEqual: @"college"]) {
        
    }
        
    return myCell;
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

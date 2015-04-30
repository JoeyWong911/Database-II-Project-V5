//
//  PlayerDetailsViewController.h
//  Database II Project V5
//
//  Created by Joey Wong on 4/30/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataClass.h"
#import "Master.h"
#import "PlayerModel.h"


@interface PlayerDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UITextViewDelegate, PlayerModelProtocol>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (weak, nonatomic) IBOutlet UITextView *detailView;

@end

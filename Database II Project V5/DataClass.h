//
//  DataClass.h
//  Database II Project V3
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject
{
    NSString *searchCol;    
}

@property(nonatomic,retain)NSString *playerFirstName;
@property(nonatomic,retain)NSString *playerLastName;
@property(nonatomic,retain)NSString *searchField;



+(DataClass*)getInstance;


@end


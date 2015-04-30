//
//  PlayerModel.m
//  Database II Project
//
//  Created by Joey Wong on 4/27/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "PlayerModel.h"

@interface PlayerModel()
{
    NSMutableData *_downloadedData;
    
}
@end

@implementation PlayerModel

- (void)downloadItems
{
    DataClass *obj=[DataClass getInstance];
    
//    NSString *query = [NSString stringWithFormat:@"SELECT * FROM master WHERE nameFirst = '%@' AND nameLast = '%@'",obj.playerFirstName,obj.playerLastName];
    
    NSString *urlString = [NSString stringWithFormat:@"http://localhost/project/Player_Query.php?FirstName=%@&LastName=%@&RequestInfo=%@",obj.playerFirstName, obj.playerLastName, obj.searchField];
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    NSURL *jsonFileUrl = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];

    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    NSLog(@"URL: %@", jsonFileUrl);
        
}

#pragma mark NSURLConnectionDataProtocol Methods


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_masters = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        //        Location *newLocation = [[Location alloc] init];
        //        newLocation.name = jsonElement[@"Name"];
        //        newLocation.address = jsonElement[@"Address"];
        //        newLocation.latitude = jsonElement[@"Latitude"];
        //        newLocation.longitude = jsonElement[@"Longitude"];
        
        DataClass *obj=[DataClass getInstance];
        
        
        Master *newMaster = [[Master alloc] init];
        
        if ([obj.searchField  isEqual: @"master"]) {
            
            newMaster.nameFirst = jsonElement[@"nameFirst"];
            newMaster.nameLast = jsonElement[@"nameLast"];
            newMaster.nameGiven = jsonElement[@"nameGiven"];
            newMaster.weight = jsonElement[@"weight"];
            newMaster.height = jsonElement[@"height"];
            newMaster.bats = jsonElement[@"bats"];
            newMaster.throws = jsonElement[@"throws"];
            newMaster.birthDay = jsonElement[@"birthDay"];
            newMaster.birthMonth = jsonElement[@"birthMonth"];
            newMaster.birthYear = jsonElement[@"birthYear"];
            newMaster.birthCity = jsonElement[@"birthCity"];
            newMaster.birthState = jsonElement[@"birthState"];
            newMaster.birthCountry = jsonElement[@"birthCountry"];
            
            
        } else if ([obj.searchField  isEqual: @"batting"]) {
            
        } else if ([obj.searchField  isEqual: @"pitching"]) {
            
        } else if ([obj.searchField  isEqual: @"fielfing"]) {
            
        } else if ([obj.searchField  isEqual: @"salaries"]) {
            
        } else if ([obj.searchField  isEqual: @"college"]) {
            
        }
        
        NSLog(@"new master gets: %@, %@",obj.playerFirstName, obj.playerLastName);
                
        
        // Add this question to the locations array
        [_masters addObject:newMaster];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_masters];
    }
}





@end

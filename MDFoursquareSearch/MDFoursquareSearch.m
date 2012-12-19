//
//  MDFoursquareSearch.m
//  Geonotifier
//
//  Created by Mert Dümenci on 12/19/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import "MDFoursquareSearch.h"

#import "AFNetworking.h"

@interface MDFoursquareSearch (private)
-(NSURLRequest *)browseURLRequestForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius andName:(NSString *)name;
-(NSURLRequest *)globalURLRequestForName:(NSString *)name;
@end

@implementation MDFoursquareSearch
#pragma mark - Lifecycle

+(MDFoursquareSearch *)sharedFoursquareSearch {
    static MDFoursquareSearch *fsSearch;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fsSearch = [[MDFoursquareSearch alloc] init];
    });
    
    return fsSearch;
}

#pragma mark - External Methods
-(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius forName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self browseURLRequestForCoordinates:coordinates radius:radius andName:name] success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSDictionary *responseDict = (NSDictionary *)JSON;
            NSInteger HTTPCode = [responseDict[@"meta"][@"code"] integerValue];
            
            if (HTTPCode == 200) {
                NSMutableArray *formattedVenuesArray = [NSMutableArray array];
                
                NSArray *venuesArray = responseDict[@"response"][@"venues"];
                for (NSDictionary *venue in venuesArray) {
                    MDFoursquarePlace *place = [[MDFoursquarePlace alloc] initWithAPIPlaceDictionary:venue];
                    [formattedVenuesArray addObject:place];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock([NSArray arrayWithArray:formattedVenuesArray]);
                });
            }
            
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(nil);
                });
            }
            
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(nil);
            });
        }];
        
        [op start];
    });
}

-(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock {
    [self searchFoursquareForCoordinates:coordinates radius:radius forName:nil withCompletionBlock:^(NSArray *locations) {
        completionBlock(locations);
    }];
}

-(void)searchFoursquareForName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self globalURLRequestForName:name] success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                NSDictionary *responseDict = (NSDictionary *)JSON;
                NSInteger HTTPCode = [responseDict[@"meta"][@"code"] integerValue];
                
                if (HTTPCode == 200) {
                    NSMutableArray *formattedVenuesArray = [NSMutableArray array];
                    
                    NSArray *venuesArray = responseDict[@"response"][@"venues"];
                    for (NSDictionary *venue in venuesArray) {
                        MDFoursquarePlace *place = [[MDFoursquarePlace alloc] initWithAPIPlaceDictionary:venue];
                        [formattedVenuesArray addObject:place];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionBlock([NSArray arrayWithArray:formattedVenuesArray]);
                    });
                }
                
                else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completionBlock(nil);
                    });
                }
                
            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(nil);
                });
            }];
            
            [op start];
    });
}

#pragma mark - Backend
-(NSURLRequest *)browseURLRequestForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius andName:(NSString *)name {
    NSString *baseURLString = @"https://api.foursquare.com/v2/venues/search?intent=browse&ll=%@&radius=%@&client_id=%@&client_secret=%@&v=20121912&limit=50";
    
    if (name) {
        baseURLString = [baseURLString stringByAppendingFormat:@"&query=%@", name];
    }
    
    NSString *formattedURLString = [NSString stringWithFormat:baseURLString, [NSString stringWithFormat:@"%f,%f", coordinates.latitude, coordinates.longitude], radius, kClientID, kClientSecret];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:formattedURLString]];
    return request;
}

-(NSURLRequest *)globalURLRequestForName:(NSString *)name {
    NSString *baseURLString = @"https://api.foursquare.com/v2/venues/search?intent=global&query=%@&client_id=%@&client_secret=%@&v=20121912&limit=50";
    NSString *formattedURLString = [NSString stringWithFormat:baseURLString, name, kClientID, kClientSecret];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:formattedURLString]];
    return request;
}

@end

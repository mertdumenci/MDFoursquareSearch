//
//  MDFoursquareSearch.h
//  Geonotifier
//
//  Created by Mert Dümenci on 12/19/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MDFoursquarePlace.h"

#warning Fill in your own API keys (https://foursquare.com/developers/apps)
#define kClientID       @""
#define kClientSecret   @""

typedef void (^FoursquareSearchCompletionBlock)(NSArray *locations); // locations is an array of MDFoursquarePlace objects

@interface MDFoursquareSearch : NSObject {
    @private
}

+(MDFoursquareSearch *)sharedFoursquareSearch;

-(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;
-(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius forName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

-(void)searchFoursquareForName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

@end

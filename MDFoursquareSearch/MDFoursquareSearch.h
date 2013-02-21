//
//  MDFoursquareSearch.h
//  Geonotifier
//
//  Created by Mert Dümenci on 12/19/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MDFoursquarePlace.h"

/*!
    @mainpage MDFoursquarePlace
    MDFoursquarePlace is a iOS Framework written by Mert Dümenci in Objective-C 2.0 and released under the MIT Open Source License.
 
    Classes in the MDFoursquarePlace Framework offer simple venue search via the Foursquare API.
 */

/*!
    @warning *Important:* You need to set your [Foursquare Client ID and Client Secret](https://foursquare.com/developers/apps) in MDFoursquareSearch.h before you can start using it.
 */

#warning Fill in your own API keys (https://foursquare.com/developers/apps)
#define kClientID       @""
#define kClientSecret   @""

typedef void (^FoursquareSearchCompletionBlock)(NSArray *locations);

@interface MDFoursquareSearch : NSObject

/*!
    @name Class Methods
 */

/*!
    Query the Foursquare API for venues within the given coordinates and radius.
 
    @param coordinates Search area center.
    @param radius Search area radius.
    @param completionBlock FoursquareSearchCompletionBlock including an array of MDFoursquarePlaces.
 */

+(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

/*!
    Query the Foursquare API for venues within the given coordinates and radius, filtered by the given name.
 
    @param coordinates Search area center.
    @param radius Search area radius.
    @param name Venue filter word.
    @param completionBlock FoursquareSearchCompletionBlock including an array of MDFoursquarePlaces.
 */

+(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius forName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

/*!
    Query the Foursquare API for venues with the given name.
    
    @param name Venue filter word.
    @param completionBlock FoursquareSearchCompletionBlock including an array of MDFoursquarePlaces.
 */

+(void)searchFoursquareForName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

@end

//
//  MDFoursquarePlace.h
//  Geonotifier
//
//  Created by Mert Dümenci on 12/19/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MDFoursquarePlace : NSObject

/*!
    @name Initialising
*/

/*!
    Initialise a new MDFoursquarePlace object.
 
    @param dict JSON venue dict returned from the Foursquare API.
    
    @return id A MDFoursquarePlace instance.
 */

-(id)initWithAPIPlaceDictionary:(NSDictionary *)dict;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *information;
@property (nonatomic) NSInteger checkInCount;
@property (nonatomic) CLLocationCoordinate2D coordinates;

@end

//
//  MDFoursquarePlace.m
//  Geonotifier
//
//  Created by Mert Dümenci on 12/19/12.
//  Copyright (c) 2012 Mert Dumenci. All rights reserved.
//

#import "MDFoursquarePlace.h"

@implementation MDFoursquarePlace
-(id)initWithAPIPlaceDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.coordinates = CLLocationCoordinate2DMake([dict[@"location"][@"lat"] doubleValue], [dict[@"location"][@"lng"] doubleValue]);
        self.information = [NSString stringWithFormat:@"%@, %@, %@", dict[@"location"][@"address"], dict[@"location"][@"city"], dict[@"location"][@"cc"]];
        self.checkInCount = [dict[@"stats"][@"checkinsCount"] integerValue];
    }
    
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, coordinates : %f/%f, check in count %d", self.name, self.information, self.coordinates.latitude, self.coordinates.longitude, self.checkInCount];
}
@end

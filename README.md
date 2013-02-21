# MDFoursquareSearch

MDFoursquareSearch is a super simple venue search API for iOS, powered by the [Foursquare Venues Search API](https://developer.foursquare.com/docs/venues/search).

## Usage

All of MDFoursquareSearch's methods are directly invokable from the class.

**Coordinate-radius based search**
```objective-c
+(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

[MDFoursquareSearch searchFoursquareForCoordinates:CLLocationCoordinate2DMake(19, 24) 
					radius:300
					withCompletionBlock:^(NSArray *locations) {
					/*
						locations : 
							MDFoursquarePlace
							MDFoursquarePlace
							MDFoursquarePlace
							...
					*/
}];
```

**Coordinate-radius based search filtered by name**
```objective-c
+(void)searchFoursquareForCoordinates:(CLLocationCoordinate2D)coordinates radius:(NSInteger)radius forName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

[MDFoursquareSearch searchFoursquareForCoordinates:CLLocationCoordinate2DMake(19, 24) 
					radius:300
					forName:@"Starbucks"
					withCompletionBlock:^(NSArray *locations) {
					/*
						locations : 
							MDFoursquarePlace
							MDFoursquarePlace
							MDFoursquarePlace
							...
					*/
}];
```

**Name based search**
```objective-c
+(void)searchFoursquareForName:(NSString *)name withCompletionBlock:(FoursquareSearchCompletionBlock)completionBlock;

[MDFoursquareSearch searchFoursquareForName:@"Starbucks" 
					withCompletionBlock:^(NSArray *locations) {
					/*
						locations : 
							MDFoursquarePlace
							MDFoursquarePlace
							MDFoursquarePlace
							...
					*/
}];
```

## Dependencies

Foundation

CoreLocation

[AFNetworking](https://github.com/AFNetworking/AFNetworking)

## License

```
Copyright (c) 2013 Mert Dümenci

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```

***

This project uses [AFNetworking](https://github.com/AFNetworking/AFNetworking). It's added as a submodule. (git submodule update --init)

```
Copyright (c) 2011 Gowalla (http://gowalla.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
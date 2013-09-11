//
//  BirdSighting.m
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import "BirdSighting.h"

@implementation BirdSighting
@synthesize name = _name;
@synthesize location = _location;
@synthesize date = _date;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date{
    self = [super init];
    if(self){
        _name = name;
        _location = location;
        _date = date;
        return  self;
    }
    return  nil;
}




@end

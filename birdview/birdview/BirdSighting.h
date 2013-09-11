//
//  BirdSighting.h
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BirdSighting : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *location;
@property(nonatomic,strong)NSDate *date;

-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date;


@end

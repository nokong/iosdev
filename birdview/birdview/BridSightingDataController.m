//
//  BridSightingDataController.m
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import "BridSightingDataController.h"
#import "BirdSighting.h"

@interface BridSightingDataController()
-(void)initializeDefailtDataList;
@end

@implementation BridSightingDataController
@synthesize masterBirdSightingList = _masterBirdSightingList;

-(void)initializeDefailtDataList {

    NSMutableArray *sightingList = [[NSMutableArray alloc]init];
    self.masterBirdSightingList = sightingList;
    [self addBirdSightingWithName:@"Pigeon" location:@"Everywhere"];
}
-(void)setMasterBirdSightingList:(NSMutableArray *)newList{
    if(_masterBirdSightingList != newList){
        _masterBirdSightingList = [newList mutableCopy];
    }
}
-(id)init{
    if(self=[super init]){
        [self initializeDefailtDataList];
        return self;
    }
    return  nil;
    
}
-(NSUInteger)countOfList{
    return [self.masterBirdSightingList count];
}
-(BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterBirdSightingList objectAtIndex:theIndex];
}
-(void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation{
    BirdSighting *sighting;
    NSDate *today = [NSDate date];
    sighting =[[BirdSighting alloc]initWithName:inputBirdName location:inputLocation date:today];
    [self.masterBirdSightingList addObject:sighting];
}
@end

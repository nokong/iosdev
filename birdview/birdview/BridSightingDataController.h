//
//  BridSightingDataController.h
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BirdSighting;

@interface BridSightingDataController : NSObject

@property(nonatomic,copy)NSMutableArray *masterBirdSightingList;

-(NSUInteger)countOfList;
-(BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex;
-(void)addBirdSightingWithName:(NSString *)inputBirdName location:(NSString *)inputLocation birdNamePath:(NSString *)inputPath;

@end

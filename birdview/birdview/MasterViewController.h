//
//  MasterViewController.h
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
@class BridSightingDataController;
@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong,nonatomic)BridSightingDataController *dataController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

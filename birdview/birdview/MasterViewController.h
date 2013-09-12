//
//  MasterViewController.h
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import <MobileCoreServices/MobileCoreServices.h>
@class BridSightingDataController;
@class AddSightingViewController;
@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property BOOL newMedia;

@property (strong,nonatomic)BridSightingDataController *dataController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)addbird:(id)sender;

@end

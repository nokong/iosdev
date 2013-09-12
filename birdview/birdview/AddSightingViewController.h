//
//  AddSightingViewController.h
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
@protocol AddSightingControllerDelegate;
@interface AddSightingViewController : UITableViewController <CLLocationManagerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property BOOL newMedia;
@property (strong,nonatomic) NSString *UrlPath;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UITextField *birdNameInput;
@property (weak, nonatomic) IBOutlet UITextField *LocationInput;
@property (weak,nonatomic)id <AddSightingControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
@protocol AddSightingControllerDelegate <NSObject>
-(void)addSightinViewControllerDidCancel:(AddSightingViewController *)controller;
-(void)addSightinViewControllerDidFinish:(AddSightingViewController *)controller name:(NSString *)name location:(NSString *)location birdImgPath:(NSString *)birdImgPath;
@end
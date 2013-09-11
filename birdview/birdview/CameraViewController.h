//
//  CameraViewController.h
//  birdview
//
//  Created by Popcorn on 9/11/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

- (IBAction)cancel:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)usecamera:(id)sender;
- (IBAction)CameraRoll:(id)sender;


@end

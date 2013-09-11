//
//  DetailViewController.h
//  teataaa
//
//  Created by Popcorn on 9/11/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

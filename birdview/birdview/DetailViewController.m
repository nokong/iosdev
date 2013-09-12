//
//  DetailViewController.m
//  birdview
//
//  Created by Popcorn on 9/10/56 BE.
//  Copyright (c) 2556 Popcorn. All rights reserved.
//

#import "DetailViewController.h"
#import "BirdSighting.h"
@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
@synthesize  sighting = _sighting;
@synthesize birdNameLabel = _birdNameLabel;
@synthesize locationLabel = _locationLabel;
@synthesize longtitudeLabel = _longtitudeLabel;
@synthesize latitudeLabel = _latitudeLabel;
@synthesize dateLabel = _dateLabel;
@synthesize imageview;
#pragma mark - Managing the detail item

- (void)setSighting:(BirdSighting *)newSighting
{
    if (_sighting != newSighting) {
        _sighting = newSighting;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    BirdSighting *theSighting = self.sighting;
    static NSDateFormatter *formatter = nil;
    if(formatter == nil){
        formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if(theSighting){
        self.birdNameLabel.text = theSighting.name;
        self.locationLabel.text = theSighting.location;
        self.dateLabel.text= [formatter stringFromDate:(NSDate *)theSighting.date];
        NSString *mediaurl = theSighting.birdImgPath;
        
        //
        ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
        {
            ALAssetRepresentation *rep = [myasset defaultRepresentation];
            CGImageRef iref = [rep fullResolutionImage];
            if (iref) {
                UIImage *largeimage = [UIImage imageWithCGImage:iref];
                [self.imageview setImage:largeimage];
            }
        };
        
        //
        ALAssetsLibraryAccessFailureBlock failureblock  = ^(NSError *myerror)
        {
            NSLog(@"booya, cant get image - %@",[myerror localizedDescription]);
        };
        
        if(mediaurl && [mediaurl length])
        {
            NSURL *asseturl = [NSURL URLWithString:mediaurl];
            ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init] ;
            [assetslibrary assetForURL:asseturl
                           resultBlock:resultblock
                          failureBlock:failureblock];
        }

    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    geocoder = [[CLGeocoder alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCurrentLocation:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError : %@",error);
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"didUpdateToLocation: %@",locations);
    CLLocation *CurrentLocation = [locations lastObject];
    CLLocation *oldLocation;
    if (locations.count > 1) {
        oldLocation = [locations objectAtIndex:locations.count-2];
    } else {
        oldLocation = nil;
    }
    if(CurrentLocation!=nil){
        self.longtitudeLabel.text = [NSString stringWithFormat:@"%.8f",CurrentLocation.coordinate.longitude];
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f",CurrentLocation.coordinate.latitude];
        [locationManager stopUpdatingLocation];
        [geocoder reverseGeocodeLocation:CurrentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                self.locationLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                     placemark.subThoroughfare, placemark.thoroughfare,
                                     placemark.postalCode, placemark.locality,
                                     placemark.administrativeArea,
                                     placemark.country];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        } ];
    }
    
}
@end

//
//  KTFirstViewController.m
//  KeepingTrack
//
//  Copyright (c) 2013, ggeoffre, LLC
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//   * Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   * Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer in the
//     documentation and/or other materials provided with the distribution.
//   * Neither the name of the ggeoffre, LLC nor the
//     names of its contributors may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL GGEOFFRE, LLC BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "KTFirstViewController.h"

@interface KTFirstViewController ()

@end

@implementation KTFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // 01 - Center the Map at a Location
//    CLLocationCoordinate2D location = {40.30444, -82.69556};
//    [self.myMapView setRegion:MKCoordinateRegionMakeWithDistance(location,300000, 300000) animated:YES];
    
    // 02 - Add an Annotation to the Map
//    [self.myMapView addAnnotation:[[KTMapAnnotation alloc] initWithCoordinate:location]];
    
    // 13 - Working with Multiple Points
    double pointOneLatitude = 39.13333;
    double pointOneLongitude = -84.50000;
    CLLocationCoordinate2D pointOneCoordinate =
        {pointOneLatitude, pointOneLongitude};
    KTMapAnnotation *pointOneAnnotation =
        [[KTMapAnnotation alloc] initWithCoordinate:pointOneCoordinate];
    [pointOneAnnotation setTypeOfAnnotation:PIN_ANNOTATION];
    [self.myMapView addAnnotation:pointOneAnnotation];
    
    double pointTwoLatitude = 39.98333;
    double pointTwoLongitude = -82.98333;
    CLLocationCoordinate2D pointTwoCoordinate =
    {pointTwoLatitude, pointTwoLongitude};
     KTMapAnnotation *pointTwoAnnotation =
     [[KTMapAnnotation alloc] initWithCoordinate:pointTwoCoordinate];
    [pointTwoAnnotation setTypeOfAnnotation:ARROW_ANNOTATION];
    [self.myMapView addAnnotation:pointTwoAnnotation];

    [self.myMapView setRegion:MKCoordinateRegionMakeWithDistance(pointTwoCoordinate,300000, 300000) animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 03 - Become a MKMapViewDelegate
- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation: (id) annotation
{
    
    // 03 - Create a custom annotation
//    MKPinAnnotationView *customAnnotationView =
//        [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    
    // 04 - Customize the Pin
//    [customAnnotationView setPinColor:MKPinAnnotationColorPurple];
//    [customAnnotationView setAnimatesDrop:YES];
            
    // 13 - Working with Multiple Points
    MKAnnotationView *customAnnotationView;
    if ([annotation isKindOfClass:[KTMapAnnotation class]] ){
        KTMapAnnotation *theAnnotation = (KTMapAnnotation*)annotation;
        if ([[theAnnotation typeOfAnnotation] isEqualToString:PIN_ANNOTATION]) {
            customAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
        }else{
            customAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];

            // 05 - Create a Custom Pin Image
//            MKAnnotationView *customAnnotationView =
//            [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
            [customAnnotationView setImage:[UIImage imageNamed:@"blue-arrow.png"]];
            
            // 06 - Supporting Drag and Drop
            [customAnnotationView setDraggable:YES];
            
            // 08 - Add a Callout
            [customAnnotationView setCanShowCallout:YES];
            
            // 10 - Add an Image to the Callout
            UIImageView *leftIconView =
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"codemash-left-callout.png"]];
            [customAnnotationView setLeftCalloutAccessoryView:leftIconView];
            
            // 11 - Add a Button to the Callout
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [customAnnotationView setRightCalloutAccessoryView:rightButton];
            
        }
    }else{
        return nil;
    }

    return customAnnotationView;
}

// 07 - Do Something when Dropped
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding)
    {
        NSLog(@"Do something when annotation is dropped");
    }
}

// 09 - Auto Display Callout
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    [self.myMapView selectAnnotation: [[self.myMapView annotations] lastObject] animated:YES];
}

// 12a - Do Something when Tapped
- (void)mapView:(MKMapView *) mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"Do Something when tapped");
    
    // 12c - Jump to the second tab
    [self.tabBarController setSelectedIndex:1];

}

@end

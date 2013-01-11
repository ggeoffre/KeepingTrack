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
    CLLocationCoordinate2D location = {40.30444, -82.69556};
    [self.myMapView setRegion:MKCoordinateRegionMakeWithDistance(location,300000, 300000) animated:YES];
    
    // 02 - Add an Annotation to the Map
    [self.myMapView addAnnotation:[[KTMapAnnotation alloc] initWithCoordinate:location]];
    
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
    
    // 05 - Create a Custom Pin Image
    MKAnnotationView *customAnnotationView =
        [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    [customAnnotationView setImage:[UIImage imageNamed:@"blue-arrow.png"]];

    
    return customAnnotationView;
}

@end

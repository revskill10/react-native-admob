//
//  ViewController.m
//  AdmobTest
//
//  Created by revskill on 3/28/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interstitial = [self createAndLoadInterstitial];

   // self.view.backgroundColor = [UIColor yellowColor];
   CGRect viewRect = [[UIScreen mainScreen] bounds];
   // CGRect rect = CGRectMake(0, viewRect.size.height - 80, 320, 50);
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
  //  self.bannerView.bounds = rect;
    self.bannerView.delegate = self;
    self.bannerView.rootViewController = self;
    self.bannerView.adUnitID =@"ca-app-pub-1026571410838165/1538784763";
    GADRequest *request = [GADRequest request];
 //   [self.view addSubview:self.bannerView];
    request.testDevices = @[
                            @"cbdadd858f8df9137ecc259559d3f613"  // Eric's iPod Touch
                            ];
    [self.bannerView loadRequest:request];
    
    NSURL *jsCodeLocation;
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"AdmobTest" launchOptions:self.launchOptions];
    rootView.frame = CGRectMake(0, 50, viewRect.size.width, viewRect.size.height - 50);
    [self.view addSubview:rootView];

    
}
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
   // GADRequest *request = [GADRequest request];
    NSLog(@"adViewDidReceiveAd");

    [self.view addSubview:adView];
   // request.testDevices = @[
    //                        @"cbdadd858f8df9137ecc259559d3f613"  // Eric's iPod Touch
    //                        ];
  //  [self.bannerView loadRequest:request];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (void)gameOver {
    RCT_EXPORT();
    NSLog(@"gameOver");
    //self.interstitial = [self createAndLoadInterstitial];
    //if ([self.interstitial isReady]) {
    //    [self.interstitial presentFromRootViewController:self];
   // }
    dispatch_async(dispatch_get_main_queue(), ^{
    
    
    // Rest of game over logic goes here.
        self.interstitial = [self createAndLoadInterstitial];
    });
}

- (GADInterstitial *)createAndLoadInterstitial {
    
    GADInterstitial *interstitial = [[GADInterstitial alloc] init];
    interstitial.adUnitID = @"ca-app-pub-1026571410838165/6761580765";
    interstitial.delegate = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"cbdadd858f8df9137ecc259559d3f613"  // Eric's iPod Touch
                            ];

    [interstitial loadRequest:request];
    return interstitial;
}
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
    NSLog(@"interstitial received");
    UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [self.interstitial presentFromRootViewController:viewController];
}
- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    
}

@end

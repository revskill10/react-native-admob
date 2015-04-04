//
//  ViewController.h
//  AdmobTest
//
//  Created by revskill on 3/28/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;
#import "RCTRootView.h"
@interface MyViewController : UIViewController<GADBannerViewDelegate, RCTBridgeModule, GADInterstitialDelegate>
@property (strong, nonatomic) GADBannerView *bannerView;
@property(nonatomic, strong) GADInterstitial *interstitial;

@property (weak, nonatomic) NSDictionary *launchOptions;
@end

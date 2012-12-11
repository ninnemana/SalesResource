//
//  AppDelegate.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/10/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
